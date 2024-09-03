import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_sound_2/constant/constants.dart';
import 'package:mr_sound_2/controllers/each_music_controller.dart';
import 'package:mr_sound_2/screens/play_music_screen.dart';

class Music extends StatelessWidget {
  const Music({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  // image: ,
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white10.withOpacity(0.01),
                  boxShadow: const [
                    BoxShadow(blurRadius: 20, color: Colors.white12),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            width: Get.width * 7 / 10,
                            height: Get.height / 3,
                            decoration: BoxDecoration(
                              color: ConstColors.buttonColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Sunday Morning',
                              style: TextStyle(
                                fontSize: 24,
                                color: ConstColors.backgroundColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Artist',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Behnam Bani',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.snackbar(
                                      '',
                                      '',
                                      titleText: Row(
                                        children: [
                                          const Text(
                                            "Start Download...",
                                            style: TextStyle(
                                              color: Colors.white70,
                                            ),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: Get.back,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color:
                                                      ConstColors.buttonColor),
                                              child: const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                    color: Colors.white70,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      shouldIconPulse: false,
                                      messageText: const SizedBox(
                                        child: Text(
                                          "Download Started. You'll have this song in just a moment.",
                                          style: TextStyle(
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ),
                                      margin: const EdgeInsets.all(10),
                                      icon: const Padding(
                                        padding: EdgeInsets.only(left: 4),
                                        child: Icon(
                                          Icons.downloading_rounded,
                                          size: 40,
                                          color: Colors.white,
                                        ),
                                      ),
                                      colorText: Colors.white,
                                      duration: const Duration(seconds: 3),
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  },
                                  child: const Icon(
                                    Icons.file_download_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Obx(
                                  () => GestureDetector(
                                    onTap: () {
                                      Get.find<EachMusicController>()
                                              .isLiked
                                              .value =
                                          !Get.find<EachMusicController>()
                                              .isLiked
                                              .value;
                                    },
                                    child: Icon(
                                      Get.find<EachMusicController>()
                                              .isLiked
                                              .value
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Get.find<EachMusicController>()
                                              .isLiked
                                              .value
                                          ? Colors.redAccent
                                          : Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: Get.width / 1.5,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white10,
                        ),
                        child: const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: IntrinsicHeight(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Icon(
                                      Icons.music_note_rounded,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '03:26',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ],
                                ),
                                VerticalDivider(
                                  color: Colors.white,
                                  thickness: 1.5,
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.play_arrow_rounded,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    Text(
                                      '3.868',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    )
                                  ],
                                ),
                                VerticalDivider(
                                  color: Colors.white,
                                  thickness: 1.5,
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    Text(
                                      '3.868',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    )
                                  ],
                                ),
                                VerticalDivider(
                                  color: Colors.white,
                                  thickness: 1.5,
                                ),
                                Column(
                                  children: [
                                    Icon(
                                      Icons.file_download_outlined,
                                      color: Colors.white,
                                      size: 25,
                                    ),
                                    Text(
                                      '3.868',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  GestureDetector(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: ConstColors.buttonColor,
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        size: 35,
                        color: ConstColors.backgroundColor,
                      ),
                    ),
                    onTap: () {
                      Get.to(() => const PlayTest());
                    },
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text(
                    'Popular Songs',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: Get.height / 3.4,
                width: Get.width,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Container(
                      height: 80,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: ConstColors.backgroundColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: Get.height / 5,
                            width: Get.width / 5,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ConstColors.buttonColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Hate Monday',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Behnam Bani',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white70,
                                    ),
                                  ),
                                  Text(
                                    '04:29',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.more_horiz_outlined,
                            color: Colors.white70,
                            size: 30,
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
