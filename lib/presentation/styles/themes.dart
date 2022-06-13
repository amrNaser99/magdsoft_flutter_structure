import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appTheme  = ThemeData(
  fontFamily: 'cairo',
  // scaffoldBackgroundColor: AppColor.primary,
  appBarTheme: const AppBarTheme(
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
) ;