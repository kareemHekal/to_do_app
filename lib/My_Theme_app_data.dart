import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/colors_app.dart';

class MyThemeAppData {
  static ThemeData ligthTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xffDFECDB),
    appBarTheme: AppBarTheme(
        color: app_colors.blue,
        elevation: 0,
        toolbarHeight: 157,
        titleSpacing: 51),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.roboto(
        color: app_colors.white,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.roboto(
        color: app_colors.white,
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: GoogleFonts.roboto(
        color: app_colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: app_colors.white,
      selectedItemColor: app_colors.blue,
      unselectedItemColor: app_colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        iconSize: 20, backgroundColor: app_colors.blue),
    useMaterial3: true,
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xff060E1E),
    appBarTheme: AppBarTheme(
        color: app_colors.blue,
        elevation: 0,
        toolbarHeight: 157,
        titleSpacing: 51),
    textTheme: TextTheme(
      bodySmall: GoogleFonts.roboto(
        color: app_colors.black,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: GoogleFonts.roboto(
        color: app_colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: GoogleFonts.roboto(
        color: app_colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: app_colors.navBarDarkColor,
      selectedItemColor: app_colors.blue,
      unselectedItemColor: app_colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        iconSize: 20, backgroundColor: app_colors.blue),
    useMaterial3: true,
  );
}
