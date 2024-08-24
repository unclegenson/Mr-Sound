import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:mr_sound_2/constant/constants.dart';
import 'package:flutter_audio_waveforms/flutter_audio_waveforms.dart';

class PlayMusic extends StatefulWidget {
  const PlayMusic({
    super.key,
  });

  @override
  State<PlayMusic> createState() => _PlayMusicState();
}

List<double> samples = [
  10,
  20,
  11,
  13,
  9,
  12,
  4,
  12,
  20,
  9,
  12,
  10,
  10,
  20,
  11,
  13,
  9,
  12,
  4,
  12,
  20,
  9,
  12,
  10,
  10,
  10,
  20,
  11,
  13,
  9,
  12,
  4,
  12,
  20,
  9,
  12,
  10,
  10,
  20,
  11,
  13,
  9,
  12,
  4,
  12,
  20,
  9,
  12,
  10,
  10,
  20,
  11,
  13,
  9,
  12,
  4,
  12,
  20,
  9,
  12,
  10,
  10,
  20,
  11,
  13,
  9,
  12,
  4,
  12,
  20,
  9,
  12,
  10
];
int activePage = 0;
late PageController _pageController;
List musics = [
  Colors.red,
  Colors.amber,
  Colors.blue,
  Colors.indigo,
  Colors.pink
];

class _PlayMusicState extends State<PlayMusic> {
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.7, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: const Key('key'),
      direction: DismissDirection.up,
      onDismissed: (direction) {
        Get.back();
      },
      child: Scaffold(
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
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    Text(
                      'Recommended',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Icon(
                      Icons.music_note_rounded,
                      size: 32,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: Get.width,
                  height: Get.height / 2.5,
                  child: PageView.builder(
                    itemCount: musics.length,
                    pageSnapping: true,
                    controller: _pageController,
                    onPageChanged: (page) {
                      setState(() => activePage = page);
                    },
                    itemBuilder: (context, pagePosition) {
                      bool active = pagePosition == activePage;
                      return slider(musics, pagePosition, active);
                    },
                  ),
                ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 4),
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
                Row(
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
                    )
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    Icon(
                      Icons.keyboard_arrow_up_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    Text(
                      'Songs',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Animated container widget
AnimatedContainer slider(musics, pagePosition, active) {
  double margin = active ? 5 : 18;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 200),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
      color: musics[pagePosition],
      borderRadius: BorderRadius.circular(20),
    ),
  );
}

// Widget for image animation while sliding carousel
imageAnimation(PageController animation, musics, pagePosition) {
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
      color: musics[pagePosition],
    ),
  );
}
