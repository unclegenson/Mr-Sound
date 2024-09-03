import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_sound_2/constant/constants.dart';
import 'package:mr_sound_2/controllers/nav_controller.dart';
import 'package:mr_sound_2/screens/download_screen.dart';
import 'package:mr_sound_2/screens/explore_screen.dart';
import 'package:mr_sound_2/screens/home_screen.dart';
import 'package:mr_sound_2/screens/play_list_screen.dart';
import 'package:mr_sound_2/screens/profile_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({
    super.key,
  });

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => Container(
          decoration: const BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: Get.find<NavController>().currentScreen.value,
            selectedItemColor: ConstColors.buttonColor,
            unselectedItemColor: Colors.grey,
            onTap: (value) {
              Get.find<NavController>().currentScreen.value = value;
            },
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: 'Home',
                backgroundColor: ConstColors.backgroundColor,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.search),
                label: 'Explore',
                backgroundColor: ConstColors.backgroundColor,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.file_download_outlined),
                label: 'Download',
                backgroundColor: ConstColors.backgroundColor,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.playlist_play_rounded),
                label: 'Playlist',
                backgroundColor: ConstColors.backgroundColor,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: 'Profile',
                backgroundColor: ConstColors.backgroundColor,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: ConstColors.backgroundColor,
      body: Obx(() => bodies[Get.find<NavController>().currentScreen.value]),
    );
  }
}

List bodies = [
  const HomeScreen(),
  const Explore(),
  const Download(),
  const PlayList(),
  const ProfileScreen(),
];
