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

//todo: radius all buttons -> 10
//todo: max heigh each page
//todo: listviewBuilders horizontal fix
//todo: decrease app size
//todo: check transition for bottom nav bar
//todo: add phone codes to complete 
//todo: enable notif screen
//todo: verify code screen

//todo: Create Favorite Songs screen
//todo: Create Notifications screen
//todo: Create Following screen
//todo: Create Activity screen
//todo: Create Settings screen