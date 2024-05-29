import 'package:flutter/material.dart';
import 'package:skin_saga/pages/coupon.dart';
import 'package:skin_saga/pages/home.dart';
import 'package:skin_saga/pages/register.dart';
import 'package:skin_saga/pages/splash.dart';
// import 'package:skin_saga/pages/register.dart';
// import 'package:skin_saga/pages/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Skin Saga',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromRGBO(174, 70, 120, 1)),
        useMaterial3: true,
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      home: Splash(),
      // home: Splash(),
    );
  }
}
