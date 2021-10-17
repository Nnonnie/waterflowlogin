import 'package:Ndiulor/background_painter.dart';
import 'package:Ndiulor/screen/auth/Register.dart';
import 'package:Ndiulor/screen/sign_In.dart';
import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  ValueNotifier<bool> showSignInPage = ValueNotifier(true);

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      body: LitAuth.custom(
        child: Stack(
          children: [
            SizedBox.expand(
              child: CustomPaint(
                painter: BackgroundPainter(
                  animation: _controller.view,
                ),
              ),
            ),
         ValueListenableBuilder<bool>(
            valueListenable: showSignInPage,
            builder: (context,value,child) {
              return value ? SignIn() : Register();
            }
         )
      
          ],
        ),
      ),
    );
  }
}
