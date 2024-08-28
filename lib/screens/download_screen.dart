import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_sound_2/constant/constants.dart';

class Download extends StatelessWidget {
  const Download({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: Get.back,
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Downloads',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: Get.height - 160,
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
                          Icons.playlist_add,
                          color: Colors.white70,
                          size: 25,
                        ),
                        SizedBox(width: 8),
                        const Icon(
                          Icons.file_download_outlined,
                          color: Colors.white70,
                          size: 25,
                        ),
                        SizedBox(width: 8),
                        const Icon(
                          Icons.more_vert_outlined,
                          color: Colors.white70,
                          size: 25,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 14,
                ),
                itemCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
