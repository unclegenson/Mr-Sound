import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_sound_2/constant/constants.dart';
import 'package:mr_sound_2/controllers/splash_controller.dart';
import 'package:mr_sound_2/screens/create_account_screen.dart';
import 'package:mr_sound_2/screens/nav_screen.dart';

late PageController _pageController;
List upTexts = [
  'Discover Inspiring',
  'Begin Your Musical',
  'Your Music Listening'
];
List buttomTexts = ['Artists and Music', 'Exploration', 'Journey Begins Here!'];

class SplashScreens extends StatefulWidget {
  const SplashScreens({super.key});

  @override
  State<SplashScreens> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {
  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.7, initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: Get.height / 2,
        width: Get.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadiusDirectional.only(
            topEnd: Radius.circular(10),
            topStart: Radius.circular(10),
          ),
          color: ConstColors.backgroundColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Obx(
                  () => Text(
                    upTexts[Get.find<SplashController>().activePage.value],
                    style: TextStyle(
                      fontSize: 26,
                      color: ConstColors.buttonColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Obx(
                  () => Text(
                    buttomTexts[Get.find<SplashController>().activePage.value],
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Text(
                'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Get.find<SplashController>().activePage.value != 0
                      ? Container(
                          margin: const EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ConstColors.buttonColor,
                          ),
                          child: IconButton(
                            onPressed: () {
                              if (Get.find<SplashController>()
                                      .activePage
                                      .value >
                                  0) {
                                Get.find<SplashController>().activePage.value -=
                                    1;
                                _pageController.animateToPage(
                                  Get.find<SplashController>().activePage.value,
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              }
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_left_outlined,
                              color: ConstColors.backgroundColor,
                              size: 30,
                            ),
                          ),
                        )
                      : const SizedBox(
                          width: 48, //todo: change this 48
                        ),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(2),
                          child: Obx(
                            () => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Get.find<SplashController>()
                                            .activePage
                                            .value ==
                                        index
                                    ? ConstColors.buttonColor
                                    : Colors.white,
                              ),
                              width: 10,
                              height: 10,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ConstColors.buttonColor,
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (Get.find<SplashController>().activePage.value < 2) {
                          Get.find<SplashController>().activePage.value += 1;
                          _pageController.animateToPage(
                            Get.find<SplashController>().activePage.value,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        } else {
                          Get.to(() => const CreateAccount());
                        }
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: ConstColors.backgroundColor,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => const CreateAccount());
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 18,
                        color: ConstColors.backgroundColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: Get.width,
              height: 310,
              child: PageView.builder(
                itemCount: 3,
                pageSnapping: true,
                controller: _pageController,
                onPageChanged: (page) {
                  Get.find<SplashController>().activePage.value = page;
                },
                itemBuilder: (context, pagePosition) {
                  return Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: Container(
                      width: Get.width,
                      height: 350,
                      color: Colors.red,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
