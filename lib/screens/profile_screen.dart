import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mr_sound_2/constant/constants.dart';
import 'package:mr_sound_2/screens/change_profile_screen.dart';

List icons = [
  Icons.person,
  Icons.music_note,
  Icons.mic_none_rounded,
  Icons.album,
  Icons.access_time_filled,
  Icons.settings,
];
List titles = [
  'Your Profile',
  'Favorite Songs',
  'Artists',
  'Albums',
  'History',
  'Settings'
];

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16),
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
                  'Profile',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
            SizedBox(
              height: 18,
            ),
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  decoration: BoxDecoration(
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
                      Get.to(() => ChangeProfile());
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Mohammad Mahdi',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
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
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white70,
                      ),
                      width: 50,
                      height: 50,
                      child: Icon(
                        Icons.workspace_premium,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Column(
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
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                ],
              ),
            ),
            Spacer(),
            SizedBox(
              height: Get.height / 2.1,
              width: Get.width,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Card(
                    color: ConstColors.backgroundColor,
                    elevation: 10,
                    child: ListTile(
                      leading: Icon(icons[index], color: Colors.white),
                      onTap: () {
                        Get.to(() => ChangeProfile());
                      },
                      title: Text(
                        titles[index],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      trailing: Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                itemCount: 6,
              ),
            )
          ],
        ),
      ),
    );
  }
}
