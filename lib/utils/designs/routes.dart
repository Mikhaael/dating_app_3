
import 'package:dating_app_3/screens/home_screen.dart';
import 'package:dating_app_3/screens/sign_up_screen.dart';
import 'package:dating_app_3/screens/welcome_screen.dart';
import 'package:flutter/material.dart';


class Routes {
  static const String welcome = '/';
  static const String signUp = '/signUp';
  static const String home = '/home';

  static Map<String, Widget Function(BuildContext)> routes = {
    welcome: (context) => const WelcomeScreen(),
    signUp: (context) => const SignUpScreen(),
    home: (context) => const HomeScreen(),
  };
}