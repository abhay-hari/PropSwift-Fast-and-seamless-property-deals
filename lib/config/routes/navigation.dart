import 'package:flutter/material.dart';

class NavigationService {
  static navigateTo({
    required BuildContext context,
    required String routeName,
    required String navigationType,
    Map<String, dynamic>? arguments,
  }) {
    switch (navigationType) {
      case 'push':
        _push(context, routeName, arguments);
        break;
      case 'pushReplacement':
        _pushReplacement(context, routeName, arguments);
        break;
      case 'pushAndRemoveUntil':
        _pushAndRemoveUntil(context, routeName, arguments);
        break;
      default:
        throw ArgumentError('Invalid navigation type: $navigationType');
    }
  }

  static void _push(
      BuildContext context, String routeName, Map<String, dynamic>? arguments) {
    Navigator.of(context).pushNamed(
      routeName,
      arguments: arguments,
    );
  }

  static void _pushReplacement(
      BuildContext context, String routeName, Map<String, dynamic>? arguments) {
    Navigator.of(context).pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  static void _pushAndRemoveUntil(
      BuildContext context, String routeName, Map<String, dynamic>? arguments) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }
}

class NavType {
  static String push = 'push';
  static String pushReplacement = 'pushReplacement';
  static String pushAndRemoveUntil = 'pushAndRemoveUntil';
}
