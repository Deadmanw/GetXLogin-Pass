import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass_/view/email_create_screen.dart';
import 'package:pass_/view/email_signin_screen.dart';
import 'package:pass_/view/home_screen.dart';
import 'package:pass_/view/intro_screen.dart';
import 'package:pass_/view/splash_screen.dart';

class Routes {
  static const splash = '/';
  static const intro = '/intro';
  static const createAccount = '/createAccount';
  static const signInEmail = '/signInEmail';
  static const home = '/home';

  static Route routes(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _buildRoute(settings, page: const SplashScreen());
      case intro:
        return _buildRoute(settings, page: const IntroScreen());
      case home:
        return _buildRoute(settings, page: const HomeScreen());
      case createAccount:
        return _buildRoute(settings, page: EmailCreate());
      case signInEmail:
        return _buildRoute(settings, page: EmailSignIn());
      default:
        throw Exception('Route does not exists');
    }
  }

  static GetPageRoute _buildRoute(RouteSettings settings,
          {required Widget page}) =>
      GetPageRoute(settings: settings, page: () => page);
}
