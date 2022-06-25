import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/main_page/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(designSize: const Size(392.7, 781.1),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => 
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            scaffoldBackgroundColor: bgColor,
            backgroundColor: Colors.black,
            primarySwatch: Colors.blue,
            appBarTheme:const  AppBarTheme(color: Colors.black),
            textTheme: const TextTheme(
              bodyText1: TextStyle(color: Colors.white),
              bodyText2: TextStyle(color: Colors.white),
            )),
        home: ScreenMainPage(),
      ),
    );
  }
}
