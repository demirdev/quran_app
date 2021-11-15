import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quran_app/theme/colors.dart';

const is_light_theme = "isLight";

ThemeData lightTheme = ThemeData(
    fontFamily: 'Poppins',
    appBarTheme: AppBarTheme(
      // backgroundColor: Colors.grey,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      // iconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: TextTheme(
      subtitle1: TextStyle(color: Colors.black),
      headline4: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26.sp,
        color: mainColor,
      ),
      headline5:
          TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF240F4F)),
      headline6:
          TextStyle(fontWeight: FontWeight.w500, color: Color(0xFF8789A3)),
    ),
    // iconTheme: IconThemeData(color: Colors.black),
    brightness: Brightness.light,
    primaryColor: mainColor,
    buttonTheme: ButtonThemeData(
      buttonColor: mainColor,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
            backgroundColor: mainColor,
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            // side: BorderSide(color: Colors.red, width: 2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            textStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ))));

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: mainColor,
);

const kIconColor = Colors.white70;

Color? confirmTextColor() => Get.isDarkMode ? null : Colors.white;
Color? buttonIconColor() => Get.isDarkMode ? Colors.black87 : Colors.white;
