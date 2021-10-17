import 'dart:math';
import 'dart:ui';

import 'package:Ndiulor/config/palette.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/animation.dart';

class BackgroundPainter extends CustomPainter {
  BackgroundPainter({Animation<double> animation})
      : greypaint = Paint()
          ..color = Palette.grey
          ..style = PaintingStyle.fill,
        bluepaint = Paint()
          ..color = Palette.blueGrey
          ..style = PaintingStyle.fill,
        redpaint = Paint()
          ..color = Palette.redAccent
          ..style = PaintingStyle.fill,
        liquidAnim = CurvedAnimation(
          curve: Curves.elasticOut,
          reverseCurve: Curves.easeInBack,
          parent: animation,
        ),
        redAnim = CurvedAnimation(
          parent: animation,
          curve: const Interval(
            0,
            0.7,
            curve: Interval(0, 0.8, curve: SpringCurve()),
          ),
          reverseCurve: Curves.linear,
        ),
        blueAnim = CurvedAnimation(
            parent: animation,
            curve: const Interval(
              0,
              0.8,
              curve: Interval(0, 0.9, curve: SpringCurve()),
            ),
            reverseCurve: Curves.easeInCirc),
        greyAnim = CurvedAnimation(
          parent: animation,
          curve: const SpringCurve(),
          reverseCurve: Curves.easeInCirc,
        ),
        super(repaint: animation);

  final Animation<double> liquidAnim;
  final Animation<double> greyAnim;
  final Animation<double> blueAnim;
  final Animation<double> redAnim;

  final Paint greypaint;
  final Paint bluepaint;
  final Paint redpaint;

  @override
  void paint(Canvas canvas, Size size) {
    print('painting');
    paintblue(canvas, size);
    paintgrey(canvas, size);
    paintred(canvas, size);
  }

  void paintblue(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(
      0,
      lerpDouble(0, size.height, blueAnim.value),
    );
    _addPointsToPath(path, [
      Point(
        lerpDouble(0, size.width / 3, blueAnim.value),
        lerpDouble(0, size.height, blueAnim.value),
      ),
      Point(
        lerpDouble(size.width / 2, size.width / 4 * 3, liquidAnim.value),
        lerpDouble(size.height / 2, size.height / 4 * 3, liquidAnim.value),
      ),
      Point(
        size.width,
        lerpDouble(size.height / 2, size.height * 3 / 4, liquidAnim.value),
      ),
    ]);

    canvas.drawPath(path, bluepaint);
  }

  void paintgrey(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width, 300);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(
      0,
      lerpDouble(size.height / 4, size.height / 2, greyAnim.value),
    );
    _addPointsToPath(path, [
      Point(
        size.width / 4,
        lerpDouble(size.height / 2, size.height * 3 / 4, liquidAnim.value),
      ),
      Point(
        size.width * 3 / 5,
        lerpDouble(size.width / 4, size.height / 2, liquidAnim.value),
      ),
      Point(
        size.width * 4 / 5,
        lerpDouble(size.height / 6, size.height / 3, greyAnim.value),
      ),
      Point(
        size.width,
        lerpDouble(size.height / 5, size.height / 4, greyAnim.value),
      ),
    ]);

    canvas.drawPath(path, greypaint);
  }

  void paintred(Canvas canvas, Size size) {
    if (redAnim.value > 0) {
      final path = Path();
      path.moveTo(size.width * 3 / 4, 0);
      path.lineTo(0, 0);
      path.lineTo(
        0,
        lerpDouble(0, size.height / 12, redAnim.value),
      );
      _addPointsToPath(path, [
        Point(
          size.width / 7,
          lerpDouble(0, size.height / 6, liquidAnim.value),
        ),
        Point(
          size.width / 3,
          lerpDouble(0, size.height / 10, liquidAnim.value),
        ),
        Point(
          size.width / 3 * 2,
          lerpDouble(0, size.height / 8, liquidAnim.value),
        ),
        Point(
          size.width / 3 * 4,
          0,
        ),
      ]);

      canvas.drawPath(path, redpaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  void _addPointsToPath(Path path, List<Point> points) {
    if (points.length < 3) {
      throw UnsupportedError('Need three or more points to create a path.');
    }
    for (var i = 0; i < points.length - 2; i++) {
      final xc = (points[i].x + points[i + 1].x) / 2;
      final yc = (points[i].y + points[i + 1].y) / 2;
      path.quadraticBezierTo(points[i].x, points[i].y, xc, yc);
    }

    // connect the last two points
    path.quadraticBezierTo(
        points[points.length - 2].x,
        points[points.length - 2].y,
        points[points.length - 1].x,
        points[points.length - 1].y);
  }
}

class Point {
  final double x;
  final double y;

  Point(this.x, this.y);
}

/// Custom curve to give gooey spring streachy effects
class SpringCurve extends Curve {
  const SpringCurve({
    this.a = 0.15,
    this.w = 19.4,
  });
  final double a;
  final double w;

  @override
  double transformInternal(double t) {
    return (-(pow(e, -t / a) * cos(t * w)) + 1).toDouble();
  }
}