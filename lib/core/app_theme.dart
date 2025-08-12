import 'package:flutter/material.dart';

final primaryColor = const Color.fromARGB(255, 56, 71, 146);

final secondryColor = const Color.fromARGB(255, 79, 102, 216);
final appTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: primaryColor,
    //centerTitle: true,
    titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  ),

  // brightness: Brightness.light,
  buttonTheme: ButtonThemeData(
    buttonColor: secondryColor,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(12),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: primaryColor,
    // selectedIconTheme: ,
    selectedItemColor: Colors.amber,
    // selectedLabelStyle: ,
    showSelectedLabels: true,
    // unselectedIconTheme: ,
    unselectedItemColor: Colors.amber,
    // unselectedLabelStyle: ,
    showUnselectedLabels: true,
  ),

  primaryColor: primaryColor,
  colorScheme: ColorScheme.light(primary: primaryColor),
  progressIndicatorTheme: ProgressIndicatorThemeData(color: primaryColor),
  // floatingActionButtonTheme: FloatingActionButtonThemeData(
  //   backgroundColor: primaryColor,
  //   foregroundColor: secondryColor,
  // ),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    floatingLabelStyle: TextStyle(color: primaryColor, fontSize: 12),
    iconColor: secondryColor,
    border: InputBorder.none,

    filled: true,
    fillColor: secondryColor,

    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: secondryColor),
      borderRadius: BorderRadius.circular(12),
    ),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
  ),
);
