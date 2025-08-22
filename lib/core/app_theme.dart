import 'package:flutter/material.dart';

// final primaryColor = const Color.fromARGB(255, 11, 21, 73);

// final secondryColor = const Color.fromARGB(255, 72, 97, 219);
// final appTheme = ThemeData(
//   appBarTheme: AppBarTheme(
//     backgroundColor: primaryColor,
//     //centerTitle: true,
//     titleTextStyle: const TextStyle(
//       color: Colors.white,
//       fontWeight: FontWeight.bold,
//     ),
//     leadingWidth: 5,
//     titleSpacing: 25,
//   ),
//   iconTheme: const IconThemeData(color: Colors.white70),
//   iconButtonTheme: const IconButtonThemeData(
//     style: ButtonStyle(iconAlignment: IconAlignment.start),
//   ),

//   // brightness: Brightness.light,
//   buttonTheme: ButtonThemeData(
//     buttonColor: secondryColor,

//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadiusGeometry.circular(12),
//     ),
//   ),
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     type: BottomNavigationBarType.fixed,
//     elevation: 0.9,
//     backgroundColor: primaryColor,
//     // selectedIconTheme: ,
//     selectedItemColor: Colors.white70,
//     // selectedLabelStyle: TextStyle(color: Colors.white),
//     showSelectedLabels: true,
//     // unselectedIconTheme: ,
//     unselectedItemColor: Colors.white30,
//     // unselectedLabelStyle: TextStyle(color: Colors.redAccent),
//     showUnselectedLabels: true,
//   ),

//   primaryColor: primaryColor,
//   colorScheme: ColorScheme.light(primary: primaryColor),
//   progressIndicatorTheme: ProgressIndicatorThemeData(color: primaryColor),
//   // floatingActionButtonTheme: FloatingActionButtonThemeData(
//   //   backgroundColor: primaryColor,
//   //   foregroundColor: secondryColor,
//   // ),
//   inputDecorationTheme: InputDecorationTheme(
//     hintStyle: const TextStyle(
//       color: Colors.white,
//       fontSize: 12,
//       fontWeight: FontWeight.bold,
//     ),
//     floatingLabelStyle: TextStyle(color: primaryColor, fontSize: 12),
//     iconColor: secondryColor,
//     border: InputBorder.none,

//     filled: true,
//     fillColor: secondryColor,

//     focusedBorder: OutlineInputBorder(
//       borderSide: BorderSide(color: secondryColor),
//       borderRadius: BorderRadius.circular(12),
//     ),
//   ),
//   textTheme: const TextTheme(
//     bodyLarge: TextStyle(
//       color: Colors.white,
//       fontSize: 40,
//       fontWeight: FontWeight.bold,
//     ),
//     bodyMedium: TextStyle(
//       color: Colors.white,
//       fontSize: 18,
//       fontWeight: FontWeight.bold,
//     ),
//     bodySmall: TextStyle(
//       color: Colors.white,
//       fontSize: 12,
//       fontWeight: FontWeight.bold,
//     ),
//   ),
// );

// things that could be done:

// 1. Fix typo and create proper color constants
class AppColors {
  // static const Color primary = Color.fromARGB(255, 11, 21, 73);
  static const Color primary = Color(0xff0f1629);
  // static const Color secondary = Color.fromARGB(255, 72, 97, 219);
  static const Color secondary = Color(0xff31329d);
  static const Color white = Colors.white;
  static const Color white54 = Colors.white54;
  static const Color white70 = Colors.white70;
  static const Color white30 = Colors.white30;
  static const Color transparent = Colors.transparent;
  static const Color thirdColor = Color.fromARGB(255, 19, 28, 111);
}

// 2. Create dimension constants
class AppDimensions {
  static const double leadingWidth = 5.0;
  static const double titleSpacing = 25.0;
  static const double borderRadius = 12.0;
  static const double smallBorderRadius = 10.0;
  static const double elevation = 0.9;
  static const double padding = 8.0;
  static const double spacing = 10.0;
  static const double largeSpacing = 20.0;
}

// 3. Create text size constants
class AppTextSizes {
  static const double large = 40.0;
  static const double medium = 18.0;
  static const double small = 12.0;
}

// 4. Create border radius constants
class AppRadius {
  static const BorderRadius larg = BorderRadius.all(Radius.circular(30.0));
  static const BorderRadius medium = BorderRadius.all(Radius.circular(12.0));
  static const BorderRadius small = BorderRadius.all(Radius.circular(10.0));
}

// 5. Improved theme with constants
final appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.primary,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary,
    titleTextStyle: const TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.bold,
    ),
    leadingWidth: AppDimensions.leadingWidth,
    titleSpacing: AppDimensions.titleSpacing,
  ),
  iconTheme: const IconThemeData(color: AppColors.white70),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.secondary,
      elevation: .9,
      iconColor: AppColors.white,
      foregroundColor: AppColors.primary,
    ),
  ),
  // floatingActionButtonTheme: FloatingActionButtonThemeData(
  //   backgroundColor: AppColors.secondary,
  //   foregroundColor: AppColors.white,
  //   focusElevation: .5,
  // ),
  iconButtonTheme: const IconButtonThemeData(
    style: ButtonStyle(iconAlignment: IconAlignment.start),
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: AppColors.secondary,
    shape: RoundedRectangleBorder(borderRadius: AppRadius.medium),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: AppDimensions.elevation,
    backgroundColor: AppColors.primary,
    selectedItemColor: AppColors.white70,
    showSelectedLabels: true,
    unselectedItemColor: AppColors.white30,
    showUnselectedLabels: true,
  ),
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
  ),
  progressIndicatorTheme: ProgressIndicatorThemeData(color: AppColors.primary),
  inputDecorationTheme: InputDecorationTheme(
    hintStyle: const TextStyle(
      color: AppColors.white,
      fontSize: AppTextSizes.small,
      fontWeight: FontWeight.bold,
    ),
    floatingLabelStyle: TextStyle(
      color: AppColors.primary,
      fontSize: AppTextSizes.small,
    ),
    iconColor: AppColors.secondary,
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: AppRadius.medium,
    ),
    filled: true,
    fillColor: AppColors.secondary,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: const Color.fromARGB(255, 6, 10, 75),
        width: 1,
      ),
      borderRadius: AppRadius.medium,
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: AppColors.white,
      fontSize: AppTextSizes.large,
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      color: AppColors.white,
      fontSize: AppTextSizes.medium,
      fontWeight: FontWeight.bold,
    ),
    bodySmall: TextStyle(
      color: AppColors.white,
      fontSize: AppTextSizes.small,
      fontWeight: FontWeight.bold,
    ),
  ),
);

// 6. Add dark theme support
// final appDarkTheme = ThemeData(
//   brightness: Brightness.dark,
//   primaryColor: AppColors.primary,
//   colorScheme: ColorScheme.dark(primary: AppColors.primary),
final appDarkTheme = ThemeData(
  brightness: Brightness.dark,
  iconTheme: const IconThemeData(color: AppColors.white70),
  primaryColor: AppColors.primary,
  colorScheme: ColorScheme.dark(
    primary: AppColors.primary,
    secondary: AppColors.secondary,
  ),
  // appBarTheme: AppBarTheme(
  //   titleTextStyle: const TextStyle(
  //     color: AppColors.white,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   leadingWidth: AppDimensions.leadingWidth,
  //   titleSpacing: AppDimensions.titleSpacing,
  // // ),
  // buttonTheme: ButtonThemeData(
  //   buttonColor: AppColors.white70,

  //   shape: RoundedRectangleBorder(borderRadius: AppRadius.medium),
  // ),
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     backgroundColor: AppColors.secondary,
  //     elevation: .9,
  //     iconColor: AppColors.white,
  //     foregroundColor: AppColors.primary,
  //   ),
  // ),
  // // floatingActionButtonTheme: FloatingActionButtonThemeData(
  // //   backgroundColor: AppColors.secondary,
  // //   foregroundColor: AppColors.white,
  // //   focusElevation: .5,
  // // ),
  // inputDecorationTheme: InputDecorationTheme(
  //   hintStyle: const TextStyle(
  //     color: AppColors.white,
  //     fontSize: AppTextSizes.small,
  //     fontWeight: FontWeight.bold,
  //   ),
  //   floatingLabelStyle: TextStyle(
  //     color: AppColors.secondary,
  //     fontSize: AppTextSizes.small,
  //   ),
  //   iconColor: AppColors.secondary,
  //   border: InputBorder.none,
  //   filled: true,
  //   fillColor: AppColors.secondary,
  //   focusedBorder: OutlineInputBorder(
  //     borderSide: BorderSide(color: AppColors.secondary),
  //     borderRadius: AppRadius.medium,
  //   ),
  // ),
);

// 7. Add theme switching capability
class AppTheme {
  static ThemeData get lightTheme => appTheme;
  static ThemeData get darkTheme => appDarkTheme;

  static ThemeData getTheme(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return lightTheme;
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.system:
        return lightTheme; // Default to light for now
    }
  }
}
