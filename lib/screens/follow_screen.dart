import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_sound_2/constant/constants.dart';
import 'package:mr_sound_2/controllers/follow_controller.dart';

class Follow extends StatefulWidget {
  const Follow({
    super.key,
  });

  @override
  State<Follow> createState() => _FollowState();
}

class _FollowState extends State<Follow> {
  @override
  void initState() {
    Get.find<FollowController>().selectedArtists.value =
        List.generate(40, (index) => false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: Get.back,
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    'Follow Artists',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: Get.height - 90,
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
                              shape: BoxShape.circle,
                              color: ConstColors.buttonColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'Behnam Bani',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Obx(
                            () => GestureDetector(
                              onTap: () {
                                switch (Get.find<FollowController>()
                                    .selectedArtists[index]) {
                                  case true:
                                    Get.find<FollowController>()
                                        .selectedArtists[index] = false;
                                    Get.find<FollowController>().follow.value =
                                        false;
                                    break;
                                  case false:
                                    Get.find<FollowController>()
                                        .selectedArtists[index] = true;
                                    Get.find<FollowController>().follow.value =
                                        true;
                                    break;
                                }
                              },
                              child: Get.find<FollowController>()
                                          .selectedArtists[index] ==
                                      true
                                  ? Container(
                                      width: 90,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: ConstColors.backgroundColor,
                                        border: Border.all(
                                            color: ConstColors.buttonColor),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Following',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: ConstColors.buttonColor,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Container(
                                      width: 80,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: ConstColors.buttonColor,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Follow',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: ConstColors.backgroundColor,
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 14,
                  ),
                  itemCount: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
