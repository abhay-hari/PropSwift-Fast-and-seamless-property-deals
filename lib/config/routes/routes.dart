import 'package:propswift/features/pages/auth/signin_page.dart';
import 'package:propswift/features/pages/auth/signup_page.dart';
import 'package:propswift/features/pages/auth/splash_screen.dart';
import 'package:propswift/features/pages/bottom_nav_bar/bottom_nav.dart';
import 'package:flutter/material.dart';

class Routes {
  // * screen name
  static const String splashPage = 'splash';
  static const String signinPage = 'signinpage';
  static const String signupPage = 'signuppage';
  static const String dashBoardPage = 'dashBoardPage';
  // * Map
  static Map<String, Widget Function(BuildContext)> allRoutes = {
    splashPage: (context) => const SplashScreen(),
    signinPage: (context) => const SigninPage(),
    signupPage: (context) => const SignupPage(),
    dashBoardPage: (context) => const BottomNav(),
  };
}
