import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/screens/user/user_login.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: EasySplashScreen(
        backgroundColor: Colors.white,
        logo: Image.asset(
          'assets/images/logo.png',
        ),
        durationInSeconds: 2,
        logoSize: 200,
        loadingText: const Text(
          'Developed By Amr Nasser',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        showLoader: true,
        loaderColor: Colors.white,
        navigator: const LoginScreen(),
      ),
    );
  }
}
