import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mr_sound_2/constant/constants.dart';
import 'package:mr_sound_2/screens/nav_screen.dart';
import 'package:mr_sound_2/screens/verify_code_screen.dart';

class EnableNotification extends StatelessWidget {
  const EnableNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: Get.height / 5,
            ),
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: ConstColors.buttonColor),
              child: const Padding(
                padding: EdgeInsets.all(18),
                child: Icon(
                  Icons.notifications,
                  size: 80,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Enable Notification Access',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const Text(
              'Enable Notification to recieve real-time\nupdates.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.to(const VerifyCode());
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: ConstColors.buttonColor,
                ),
                width: Get.width - 40,
                height: 50,
                child: Center(
                  child: Text(
                    'Allow Notification',
                    style: TextStyle(
                      color: ConstColors.backgroundColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Maybe Later',
                style: TextStyle(
                  color: ConstColors.buttonColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 5,
            ),
          ],
        ),
      ),
    );
  }
}
