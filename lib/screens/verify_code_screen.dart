import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mr_sound_2/constant/constants.dart';
import 'package:mr_sound_2/screens/nav_screen.dart';

class VerifyCode extends StatefulWidget {
  const VerifyCode({super.key});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final TextEditingController _firstDigitController = TextEditingController();
  final TextEditingController _secondDigitController = TextEditingController();
  final TextEditingController _thirdDigitController = TextEditingController();
  final TextEditingController _fourthDigitController = TextEditingController();

  final FocusNode _firstFocus = FocusNode();
  final FocusNode _secondFocus = FocusNode();
  final FocusNode _thirdFocus = FocusNode();
  final FocusNode _fourthFocus = FocusNode();
  @override
  void initState() {
    super.initState();

    _firstDigitController.addListener(() {
      if (_firstDigitController.text.length == 1) {
        FocusScope.of(context).requestFocus(_secondFocus);
      }
    });

    _secondDigitController.addListener(() {
      if (_secondDigitController.text.length == 1) {
        FocusScope.of(context).requestFocus(_thirdFocus);
      } else if (_secondDigitController.text.isEmpty) {
        FocusScope.of(context).requestFocus(_firstFocus);
      }
    });

    _thirdDigitController.addListener(() {
      if (_thirdDigitController.text.length == 1) {
        FocusScope.of(context).requestFocus(_fourthFocus);
      } else if (_thirdDigitController.text.isEmpty) {
        FocusScope.of(context).requestFocus(_secondFocus);
      }
    });

    _fourthDigitController.addListener(() {
      if (_fourthDigitController.text.isEmpty) {
        FocusScope.of(context).requestFocus(_thirdFocus);
      }
    });
  }

  @override
  void dispose() {
    _firstDigitController.dispose();
    _secondDigitController.dispose();
    _thirdDigitController.dispose();
    _fourthDigitController.dispose();
    _firstFocus.dispose();
    _secondFocus.dispose();
    _thirdFocus.dispose();
    _fourthFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: Get.back,
                        child: const Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Verify Code',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    'Please enter the code we just sent to email\nexample@gmail.com',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildDigitField(
                          _firstDigitController, _firstFocus, _secondFocus),
                      _buildDigitField(
                          _secondDigitController, _secondFocus, _thirdFocus),
                      _buildDigitField(
                          _thirdDigitController, _thirdFocus, _fourthFocus),
                      _buildDigitField(
                          _fourthDigitController, _fourthFocus, null),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Column(
                    children: [
                      Text(
                        "Dont recive OTP?",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white70,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Resend Code",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const NavScreen());
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
                          'Verify',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height / 2.1)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDigitField(TextEditingController controller,
      FocusNode currentFocus, FocusNode? nextFocus) {
    return SizedBox(
      width: 50,
      child: TextField(
        style: TextStyle(color: ConstColors.buttonColor),
        controller: controller,
        focusNode: currentFocus,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        decoration: const InputDecoration(
          counterText: '', // Hide the counter
          border: OutlineInputBorder(),
        ),
        onChanged: (value) {
          if (value.isNotEmpty) {
            FocusScope.of(context).requestFocus(nextFocus);
          }
        },
      ),
    );
  }
}
