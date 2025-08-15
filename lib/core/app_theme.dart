import 'package:flutter/material.dart';

final primaryColor = const Color.fromARGB(255, 11, 21, 73);

final secondryColor = const Color.fromARGB(255, 72, 97, 219);
final appTheme = ThemeData(
  appBarTheme: AppBarTheme(
    backgroundColor: primaryColor,
    //centerTitle: true,
    titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    leadingWidth: 5,
    titleSpacing: 25,
  ),
  iconTheme: IconThemeData(color: Colors.white70),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(iconAlignment: IconAlignment.start),
  ),

  // brightness: Brightness.light,
  buttonTheme: ButtonThemeData(
    buttonColor: secondryColor,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.circular(12),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 0.9,
    backgroundColor: primaryColor,
    // selectedIconTheme: ,
    selectedItemColor: Colors.white70,
    // selectedLabelStyle: TextStyle(color: Colors.white),
    showSelectedLabels: true,
    // unselectedIconTheme: ,
    unselectedItemColor: Colors.white30,
    // unselectedLabelStyle: TextStyle(color: Colors.redAccent),
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
