import 'package:flutter/material.dart';

final primaryColor = const Color.fromARGB(255, 11, 21, 73);

final secondryColor = const Color.fromARGB(255, 72, 97, 219);
final appTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: secondryColor,
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
    backgroundColor: secondryColor,
    // selectedIconTheme: ,
    selectedItemColor: Colors.black,
    // selectedLabelStyle: ,
    showSelectedLabels: true,
    // unselectedIconTheme: ,
    unselectedItemColor: primaryColor,
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
