import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_audio_waveforms/flutter_audio_waveforms.dart';
import 'package:get/get.dart';
import 'package:mr_sound_2/constant/constants.dart';
import 'package:mr_sound_2/controllers/music_player_page.dart';
import 'package:mr_sound_2/controllers/show_end_widget_controller.dart';

List<double> samples = [];
late PageController _pageController;
List titles = [
  'Play Now',
  'Add to Favorites',
  'Play Next',
  'Add to Playlist',
  'Add to queue',
  'Download',
  'View Artist',
  'Go to Album',
  'Share'
];
List icons = [
  Icons.play_arrow_rounded,
  Icons.favorite_border,
  Icons.playlist_play_rounded,
  Icons.playlist_add_sharp,
  Icons.queue_music,
  Icons.file_download_outlined,
  Icons.person,
  Icons.album,
  Icons.share
];

class PlayTest extends StatefulWidget {
  const PlayTest({super.key});

  @override
  State<PlayTest> createState() => _PlayTestState();
}

ScrollController _scrollController = ScrollController();

class _PlayTestState extends State<PlayTest> {
  @override
  void initState() {
    samples = [];
    for (var i = 0; i < 100; i++) {
      samples.add(Random().nextDouble() * 30);
    }
    _pageController = PageController(viewportFraction: 0.7, initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar:
            Get.find<ShowEndWidget_SearchBar_Controller>().showEndWidget.value
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ConstColors.buttonColor,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: Get.width,
                    height: 70,
                    child: Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          color: Colors.black,
                          size: 60,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sunday Morning',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              'Behnam Bani',
                              style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ConstColors.itemColor,
                          ),
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.pause,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : const SizedBox(),
        backgroundColor: ConstColors.backgroundColor,
        body: NotificationListener<ScrollUpdateNotification>(
          onNotification: (notification) {
            if (_scrollController.position.pixels > Get.height * 4 / 5) {
              Get.find<ShowEndWidget_SearchBar_Controller>()
                  .showEndWidget
                  .value = true;
            } else {
              Get.find<ShowEndWidget_SearchBar_Controller>()
                  .showEndWidget
                  .value = false;
            }
            return true;
          },
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                pinned: true,
                title: const Text(
                  'Music Player',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                centerTitle: true,
                backgroundColor: ConstColors.backgroundColor,
                elevation: 0,
                leading: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                ),
                actions: [
                  GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                        backgroundColor: Colors.white24,
                        isScrollControlled: true,
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            SizedBox(
                              height: Get.height,
                              width: Get.width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: ConstColors.backgroundColor,
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    height: Get.height * 7 / 10,
                                    child: Column(
                                      children: [
                                        const Spacer(),
                                        const Divider(
                                          indent: 20,
                                          endIndent: 20,
                                          thickness: 0.5,
                                          color: Colors.white54,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: Get.height * 3.1 / 7,
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: 9,
                                            itemBuilder: (context, index) {
                                              return Material(
                                                color:
                                                    ConstColors.backgroundColor,
                                                child: ListTile(
                                                  onTap: () {},
                                                  dense: true,
                                                  visualDensity:
                                                      const VisualDensity(
                                                          vertical: -4),
                                                  leading: Icon(
                                                    icons[index],
                                                    color: Colors.white,
                                                  ),
                                                  title: Text(
                                                    titles[index],
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 28),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: ConstColors.buttonColor,
                                      ),
                                      child: IconButton(
                                        onPressed: Get.back,
                                        icon: Icon(
                                          Icons.close_rounded,
                                          color: ConstColors.backgroundColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: Get.width * 1 / 2,
                                    height: Get.width * 1 / 2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: ConstColors.buttonColor,
                                    ),
                                  ),
                                  const Column(
                                    children: [
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Sunday Morning',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 30,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Behnam Bani',
                                            style: TextStyle(
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 18,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Icon(
                                            Icons.check_circle_sharp,
                                            color: Colors.white,
                                            size: 17,
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.more_vert_rounded,
                        size: 32,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  width: Get.width,
                  height: Get.height / 2.5,
                  child: PageView.builder(
                    itemCount: 10,
                    pageSnapping: true,
                    controller: _pageController,
                    onPageChanged: (page) {
                      samples = [];
                      for (var i = 0; i < 100; i++) {
                        samples.add(Random().nextDouble() * 30);
                      }
                      Get.find<MusicPlayerController>().activePage.value = page;
                    },
                    itemBuilder: (context, pagePosition) {
                      return slider(pagePosition);
                    },
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Sunday Morning',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                    ),
                    const Text(
                      'Behnam Bani',
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RectangleWaveform(
                      inactiveBorderColor: Colors.white10,
                      borderWidth: 1,
                      isRoundedRectangle: true,
                      activeBorderColor: Colors.blue,
                      samples: samples,
                      height: 60,
                      activeColor: Colors.white70,
                      inactiveColor: Colors.white10,
                      width: Get.width - 40,
                      absolute: true,
                      maxDuration: const Duration(seconds: 10),
                      elapsedDuration: const Duration(seconds: 6),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '00:00',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          ),
                          Text(
                            '03:26',
                            style: TextStyle(color: Colors.white, fontSize: 10),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.repeat,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_double_arrow_left_sharp,
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ConstColors.buttonColor,
                            ),
                            child: Icon(
                              Icons.pause,
                              color: ConstColors.backgroundColor,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_double_arrow_right_sharp,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.shuffle,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 16,
                    ),
                    const Column(
                      children: [
                        Icon(
                          Icons.keyboard_arrow_up_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          'Lyrics',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18),
                      child: SizedBox(
                        height: Get.height,
                        width: Get.width,
                        child: const Text(
                          'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Animated container widget
Obx slider(pagePosition) {
  return Obx(
    () => AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(
          pagePosition == Get.find<MusicPlayerController>().activePage.value
              ? 5
              : 18),
      decoration: BoxDecoration(
        color: ConstColors.buttonColor,
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}

// Widget for image animation while sliding carousel
imageAnimation(PageController animation, pagePosition) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      return SizedBox(
        width: 200,
        height: 200,
        child: widget,
      );
    },
    child: Container(
      margin: const EdgeInsets.all(10),
      color: ConstColors.buttonColor,
    ),
  );
}
