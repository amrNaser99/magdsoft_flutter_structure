import 'package:flutter/material.dart';
import '../screens/shared/splash_screen.dart';
import '../screens/user/user_login.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return null;
    }
  }
}