import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_sound_2/constant/constants.dart';
import 'package:mr_sound_2/screens/change_profile_screen.dart';
import 'package:mr_sound_2/screens/help_screen.dart';

List icons = [
  Icons.person,
  Icons.music_note,
  Icons.notifications,
  Icons.group_rounded,
  Icons.access_time_filled,
  Icons.settings,
];
List titles = [
  'Your Profile',
  'Favorite Songs',
  'Notifications',
  'Following',
  'Activity',
  'Settings'
];

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  'Profile',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const HelpCenterScreen());
                  },
                  child: const Icon(Icons.help_outlined,
                      color: Colors.white, size: 25),
                )
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  width: Get.width / 3,
                  height: Get.width / 3,
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: ConstColors.buttonColor),
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: ConstColors.backgroundColor,
                      size: 20,
                    ),
                    onPressed: () {
                      Get.to(() => const ChangeProfile());
                    },
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Mohammad Mahdi',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: Get.width,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: ConstColors.buttonColor,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white70,
                      ),
                      width: 50,
                      height: 50,
                      child: const Icon(
                        Icons.workspace_premium,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Get Premium Plan',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'Lorem Ipsum ...',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              height: Get.height / 2.1,
              width: Get.width,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    color: ConstColors.backgroundColor,
                    elevation: 10,
                    child: ListTile(
                      shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      leading: Icon(icons[index], color: Colors.white),
                      onTap: () {
                        Get.to(() => const ChangeProfile());
                      },
                      title: Text(
                        titles[index],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                itemCount: 6,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
