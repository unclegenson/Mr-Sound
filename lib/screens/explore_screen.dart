import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_sound_2/constant/constants.dart';
import 'package:mr_sound_2/controllers/bubble_controller.dart';

List bubbles = ['Suggested', 'Songs', 'Artists', 'Albums', 'Recently Played'];

class Explore extends StatelessWidget {
  const Explore({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
        child: Obx(
          () => SingleChildScrollView(
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
                      'Explore',
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
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ConstColors.itemColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    width: Get.width,
                    height: 60,
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        label: Text('Search Here...'),
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  width: Get.width,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Obx(
                        () => GestureDetector(
                          onTap: () {
                            Get.find<BubbleController>().bubbleIndex.value =
                                index;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: index ==
                                      Get.find<BubbleController>()
                                          .bubbleIndex
                                          .value
                                  ? ConstColors.buttonColor
                                  : ConstColors.itemColor,
                            ),
                            child: Center(
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  bubbles[index],
                                  style: TextStyle(
                                    color: index ==
                                            Get.find<BubbleController>()
                                                .bubbleIndex
                                                .value
                                        ? Colors.black
                                        : Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 8,
                      );
                    },
                    itemCount: 5,
                  ),
                ),
                if (Get.find<BubbleController>().bubbleIndex.value == 0)
                  SizedBox(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Popular Artists',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'See All',
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: Get.height / 5,
                          width: Get.width,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Container(
                                    width: 130,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: ConstColors.buttonColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Behnam Bani',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 12,
                            ),
                            itemCount: 10,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Recently Played Songs',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'See All',
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: SizedBox(
                            height: Get.height / 3,
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: ConstColors.buttonColor,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
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
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                      const SizedBox(width: 8),
                                      const Icon(
                                        Icons.file_download_outlined,
                                        color: Colors.white70,
                                        size: 25,
                                      ),
                                      const SizedBox(width: 8),
                                      const Icon(
                                        Icons.more_vert_outlined,
                                        color: Colors.white70,
                                        size: 25,
                                      ),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 14,
                              ),
                              itemCount: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else if (Get.find<BubbleController>().bubbleIndex.value == 1)
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: Get.height / 1.55,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                  const SizedBox(width: 8),
                                  const Icon(
                                    Icons.file_download_outlined,
                                    color: Colors.white70,
                                    size: 25,
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(
                                    Icons.more_vert_outlined,
                                    color: Colors.white70,
                                    size: 25,
                                  ),
                                  const SizedBox(width: 8),
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
                if (Get.find<BubbleController>().bubbleIndex.value == 2)
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: Get.height / 1.55,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisExtent: Get.height / 5.5,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 110,
                                    decoration: BoxDecoration(
                                      color: ConstColors.buttonColor,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'Taylor Swift',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          itemCount: 30,
                        ),
                      )
                    ],
                  )
                else if (Get.find<BubbleController>().bubbleIndex.value == 3)
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: Get.height / 1.5,
                        child: GridView.builder(
                          itemCount: 20,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisExtent: Get.height / 3,
                          ),
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: Get.width / 2.25,
                                  height: Get.width / 2.25,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: ConstColors.itemColor,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.play_circle_fill_outlined,
                                      color: ConstColors.buttonColor,
                                      size: 40,
                                    ),
                                  ),
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Vivid Vortex',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 4),
                                      child: Icon(
                                        Icons.more_vert_outlined,
                                        color: Colors.white70,
                                      ),
                                    )
                                  ],
                                ),
                                const Text(
                                  'Behnam Bani',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Text(
                                  '25 Songs',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  )
                else if (Get.find<BubbleController>().bubbleIndex.value == 4)
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: Get.height / 1.55,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                  const SizedBox(width: 8),
                                  const Icon(
                                    Icons.file_download_outlined,
                                    color: Colors.white70,
                                    size: 25,
                                  ),
                                  const SizedBox(width: 8),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
