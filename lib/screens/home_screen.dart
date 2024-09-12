import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_sound_2/constant/constants.dart';
import 'package:mr_sound_2/controllers/show_end_widget_controller.dart';
import 'package:mr_sound_2/screens/artist_screen.dart';
import 'package:mr_sound_2/screens/choose_your_plan.dart';
import 'package:mr_sound_2/screens/each_music.dart';

final _focusNode = FocusNode();
List categories = [
  'Pop music',
  'Hip hop music',
  'Rock music',
  'Rhythm and blues',
  'Guran',
  'Soul music',
  'Reggae music',
  'Country music',
  'Funk music',
  'Folk music',
  'Jazz music',
  'Disco music',
  'Classical music',
  'Electronic music',
  'Blues music',
  'New age music',
  'Christian Music',
  'Traditional Music',
  'Ska music',
  'Metal music',
  'Brazilian music',
  'Flamenco music',
  'Salsa music',
  'Merengue music',
  'Bachata music',
  'Indian classic',
];

void _toggleSearch() {
  Get.find<ShowEndWidget_SearchBar_Controller>().isSearchActive.value =
      !Get.find<ShowEndWidget_SearchBar_Controller>().isSearchActive.value;
  if (!Get.find<ShowEndWidget_SearchBar_Controller>().isSearchActive.value) {
    _focusNode.unfocus();
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
        child: SingleChildScrollView(
          child: SizedBox(
            height: Get.height * 2.1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.circle,
                        color: Colors.white,
                        size: 40,
                      ),
                      const Text(
                        'Home',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Obx(
                        () => GestureDetector(
                          onTap: _toggleSearch,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            width:
                                Get.find<ShowEndWidget_SearchBar_Controller>()
                                        .isSearchActive
                                        .value
                                    ? 200
                                    : 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: Get.find<
                                                  ShowEndWidget_SearchBar_Controller>()
                                              .isSearchActive
                                              .value
                                          ? 10
                                          : 0),
                                  child: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                Get.find<ShowEndWidget_SearchBar_Controller>()
                                        .isSearchActive
                                        .value
                                    ? Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: TextField(
                                            autofocus: true,
                                            focusNode: _focusNode,
                                            style: const TextStyle(
                                                color: Colors.white),
                                            decoration: const InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Type to search...",
                                              hintStyle: TextStyle(
                                                  color: Colors.white70),
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Container(
                    width: Get.width,
                    height: Get.height / 5,
                    decoration: BoxDecoration(
                      color: ConstColors.itemColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '30-Day Free',
                                style: TextStyle(
                                  fontSize: 26,
                                  color: ConstColors.buttonColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const Text(
                                ' Trial',
                                style: TextStyle(
                                  fontSize: 26,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'Only For You!',
                            style: TextStyle(
                              fontSize: 26,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: 135,
                            height: 45,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ConstColors.buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Get.to(() => const Plans());
                              },
                              child: Text(
                                'Try For Free',
                                style: TextStyle(
                                    color: ConstColors.backgroundColor,
                                    fontSize: 17),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'New Releases',
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
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: Get.height / 5,
                  width: Get.width,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => const Music());
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ConstColors.buttonColor,
                              ),
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ConstColors.itemColor,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(
                                      Icons.play_arrow,
                                      color: ConstColors.buttonColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sunday Morning',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'Behnam Bani',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: 10,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Artists',
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
                ),
                const SizedBox(height: 5),
                SizedBox(
                  height: Get.height / 4.7,
                  width: Get.width,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => const ArtistScreen());
                        },
                        child: Column(
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
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 12,
                    ),
                    itemCount: 10,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Trending Songs',
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
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: Get.height / 4,
                  width: Get.width,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => const Music());
                        },
                        child: Container(
                          width: Get.width / 2.2,
                          height: 170,
                          decoration: BoxDecoration(
                            color: ConstColors.itemColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              Container(
                                width: Get.width / 2.2,
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ConstColors.buttonColor,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Sunday Morning',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        'Behnam Bani',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.white70,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.play_circle_fill_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: 10,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Categories',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SizedBox(
                    height: Get.height * 6 / 10,
                    width: Get.width,
                    child: GridView.builder(
                      itemCount: categories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4),
                          child: Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Container(
                                height: Get.height / 4,
                                width: Get.width / 2 - 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: ConstColors.buttonColor,
                                ),
                                child: Center(
                                  child: Text(
                                    categories[index],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Suggested for You',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: Get.height / 5,
                  width: Get.width,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 12),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => const Music());
                        },
                        child: Column(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ConstColors.buttonColor,
                              ),
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ConstColors.itemColor,
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.play_arrow,
                                      color: ConstColors.buttonColor,
                                    ),
                                    onPressed: () {},
                                  ),
                                ),
                              ),
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sunday Morning',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'Behnam Bani',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
