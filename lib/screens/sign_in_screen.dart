import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mr_sound_2/constant/constants.dart';
import 'package:mr_sound_2/screens/complete_your_profile.dart';
import 'package:mr_sound_2/screens/create_account_screen.dart';
import 'package:mr_sound_2/screens/forgot_password.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ConstColors.buttonColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: Get.width,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ConstColors.buttonColor.withAlpha(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          style: TextStyle(color: ConstColors.buttonColor),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'unclegenson@gmail.com',
                            border: InputBorder.none,
                            hintStyle:
                                TextStyle(color: ConstColors.buttonColor),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ConstColors.buttonColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Container(
                          width: Get.width,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: ConstColors.buttonColor.withAlpha(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: TextFormField(
                              style: TextStyle(color: ConstColors.buttonColor),
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                hintText: '************',
                                border: InputBorder.none,
                                hintStyle:
                                    TextStyle(color: ConstColors.buttonColor),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Icon(
                            Icons.remove_red_eye,
                            color: ConstColors.buttonColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => const NewPassword());
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              decorationColor: ConstColors.buttonColor,
                              decorationThickness: 1.5,
                              color: ConstColors.buttonColor,
                              decoration: TextDecoration.underline,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const CompleteProfile());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ConstColors.buttonColor,
                    ),
                    width: Get.width,
                    height: 55,
                    child: const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Get.width / 3,
                      child: const Divider(
                        endIndent: 10,
                        color: Colors.white70,
                      ),
                    ),
                    const Text(
                      'Or Sign In with',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(
                      width: Get.width / 3,
                      child: const Divider(
                        color: Colors.white70,
                        indent: 10,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: ConstColors.buttonColor),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: ConstColors.buttonColor),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: ConstColors.buttonColor),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Dont have an account?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const CreateAccount());
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          decorationColor: ConstColors.buttonColor,
                          decorationThickness: 1.5,
                          color: ConstColors.buttonColor,
                          decoration: TextDecoration.underline,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
