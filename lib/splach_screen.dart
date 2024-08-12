import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_app.dart';

class SpalchScreen extends StatefulWidget {
  const SpalchScreen({super.key});

  @override
  State<SpalchScreen> createState() => _SpalchScreenState();
}

class _SpalchScreenState extends State<SpalchScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, '/HomeScreen');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: app_colors.backGroundColorLigthTheme,
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Spacer(),
          Image.asset(
            "assets/images/logo.png",
            width: 262,
            height: 262,
          ),
          Spacer(),
          Text(
            '''
 T O  D O  A P P  B Y
   K A R E E M  H E K A L
          ''',
            textAlign: TextAlign.center,
            style: GoogleFonts.bebasNeue(color: app_colors.blue,
                fontSize: 30, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
