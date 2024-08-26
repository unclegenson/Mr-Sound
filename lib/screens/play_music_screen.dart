import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_audio_waveforms/flutter_audio_waveforms.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:mr_sound_2/constant/constants.dart';

List<double> samples = [];
int activePage = 0;
late PageController _pageController;
List titles = [
  'Play Now',
  'Save to Library',
  'Play Next',
  'Add to Playlist',
  'Add to queue',
  'Download',
  'View Artist',
  'Go to Album',
  'Share'
];

class PlayTest extends StatefulWidget {
  const PlayTest({super.key});

  @override
  State<PlayTest> createState() => _PlayTestState();
}

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
    return Scaffold(
      backgroundColor: ConstColors.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(
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
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Get.bottomSheet(
                    elevation: 150,
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
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    )),
                                height: Get.height * 5 / 7,
                                child: Column(
                                  children: [
                                    Spacer(),
                                    Divider(
                                      indent: 20,
                                      endIndent: 20,
                                      thickness: 0.5,
                                      color: Colors.white54,
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    SizedBox(
                                      height: Get.height * 3 / 7,
                                      child: ListView.builder(
                                        itemCount: 9,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            dense: true,
                                            visualDensity:
                                                VisualDensity(vertical: -4),
                                            leading: Icon(Icons.abc),
                                            title: Text(
                                              titles[index],
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
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
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                  setState(() {
                    activePage = page;
                  });
                },
                itemBuilder: (context, pagePosition) {
                  bool active = pagePosition == activePage;
                  return slider(pagePosition, active);
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
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
                Text(
                  'Behnam Bani',
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
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
                  maxDuration: Duration(seconds: 10),
                  elapsedDuration: Duration(seconds: 6),
                ),
                SizedBox(
                  height: 4,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
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
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.repeat,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
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
                        icon: Icon(
                          Icons.keyboard_double_arrow_right_sharp,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
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
                Column(
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
                SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: Text(
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ConstColors.buttonColor,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: Get.width,
                  height: 70,
                  child: Row(
                    children: [
                      Icon(
                        Icons.circle,
                        color: Colors.black,
                        size: 60,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Column(
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
                      Spacer(),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ConstColors.itemColor,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.pause,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Animated container widget
AnimatedContainer slider(pagePosition, active) {
  double margin = active ? 5 : 18;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
      color: ConstColors.buttonColor,
      borderRadius: BorderRadius.circular(20),
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
