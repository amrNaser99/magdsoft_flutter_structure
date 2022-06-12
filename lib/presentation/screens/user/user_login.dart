import 'package:flutter/material.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColor.white,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              color: AppColor.primary,
              child: const Image(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: AppColor.white,
    );
  }
}
