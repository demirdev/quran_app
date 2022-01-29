import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:quran_app/bloc/surah/surah_bloc.dart';
import 'package:quran_app/theme/theme_data.dart';

import 'screens/home/home_screen.dart';

void main() {
  Get.put<SurahBloc>(SurahBloc());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        // home: ReciteScreen(surahNumber: 1),
        home: HomeScreen(),
        // home: OnBoardingScreen(),

        // PixelPerfect(
        //   // assetPath: 'assets/image/splash.jpeg',
        //   scale: 0.96,
        //   assetPath: 'assets/image/home.jpeg',
        //   child: HomeScreen(),
        //   // child: OnBoardingScreen(),
        // ),
      ),
    );
  }
}
