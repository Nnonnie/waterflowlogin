import 'package:Ndiulor/config/palette.dart';
import 'package:Ndiulor/screen/auth/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Ndiulor());
}

class Ndiulor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LitAuthInit(
      child: MaterialApp(     
         title: 'Front Page',
         theme:ThemeData(
           visualDensity: VisualDensity.adaptivePlatformDensity,
           textTheme: GoogleFonts.muliTextTheme(),
           accentColor: Palette.amberDAccent,
           appBarTheme: const AppBarTheme(
             brightness: Brightness.dark,
             color:Palette.redAccent,
              )
         ),
      home:  AuthScreen(),
      ),
    );
    
  }
}