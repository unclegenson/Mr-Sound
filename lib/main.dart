import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mr_sound_2/bindings/my_bindings.dart';
import 'package:mr_sound_2/screens/splash_screen.dart';
import 'package:mr_sound_2/screens/splash_start.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      systemNavigationBarColor: Colors.black,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 3),
      () {
        Get.offAll(() => const SplashStartScreen());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MyBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Mr Sound',
      home: const SplashScreen(),
    );
  }
}

//todo: radius all buttons -> 30
//todo: add phone codes to complete complete your profile

//todo: Create Notifications screen
//todo: Create Settings screen
//todo: press back button again to close the app
//todo: clippath to splash screens
 