import 'package:clean_archtecture_template_abhay/features/pages/auth/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  // * screen name
  static const String splashPage = 'splash';
  // * Map
  static Map<String, Widget Function(BuildContext)> allRoutes = {
    splashPage: (context) => const SplashScreen(),
  };
}
