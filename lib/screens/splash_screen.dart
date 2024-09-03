import 'package:flutter/material.dart';
import 'package:mr_sound_2/constant/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.music_note_rounded,
                  size: 80,
                  color: ConstColors.buttonColor,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Mr.Sound',
                  style: TextStyle(
                    color: ConstColors.buttonColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
