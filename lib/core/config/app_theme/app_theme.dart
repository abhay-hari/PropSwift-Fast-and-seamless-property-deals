import 'package:clean_archtecture_template_abhay/core/config/app_color/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColor.primary,
    brightness: Brightness.light,
    fontFamily: 'NotoSans',
    scaffoldBackgroundColor: AppColor.whiteColor,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColor.blackColor,
    ),
    buttonTheme: const ButtonThemeData(buttonColor: AppColor.primary),
    // elevatedButtonTheme: ElevatedButton.styleFrom(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular()
    //   )
    // )
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder()
      },
    ),
  );
  static final darkTheme = ThemeData(
    primaryColor: AppColor.primary,
    brightness: Brightness.light,
    fontFamily: 'NotoSans',
    scaffoldBackgroundColor: AppColor.darkBackground,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColor.blackColor,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: CupertinoPageTransitionsBuilder()
      },
    ),
  );
}
