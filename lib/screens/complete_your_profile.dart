import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mr_sound_2/constant/constants.dart';
import 'package:mr_sound_2/screens/enable_notif_screen.dart';

List categoryItems = ['Male', 'Female'];

class CompleteProfile extends StatelessWidget {
  const CompleteProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: Get.back,
                      child: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Complete Your Profile',
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white70,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ConstColors.itemColor,
                        ),
                        width: Get.width / 3,
                        height: Get.width / 3,
                        child: Icon(
                          Icons.person,
                          size: Get.width / 5,
                          color: ConstColors.buttonColor,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: ConstColors.buttonColor,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.edit,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Name',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ConstColors.buttonColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: Get.width,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ConstColors.buttonColor.withAlpha(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          style: TextStyle(color: ConstColors.buttonColor),
                          decoration: InputDecoration(
                            hintText: 'Mohammad Mahdi',
                            border: InputBorder.none,
                            hintStyle:
                                TextStyle(color: ConstColors.buttonColor),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Phone Number',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ConstColors.buttonColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: Get.width,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ConstColors.buttonColor.withAlpha(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          style: TextStyle(color: ConstColors.buttonColor),
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            hintText: 'Enter Phone Number',
                            border: InputBorder.none,
                            hintStyle:
                                TextStyle(color: ConstColors.buttonColor),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'Gender',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: ConstColors.buttonColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      width: Get.width,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: ConstColors.buttonColor.withAlpha(100),
                      ),
                      child: DropdownButtonFormField2(
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                        isExpanded: true,
                        decoration: const InputDecoration(
                          iconColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                          border: InputBorder.none,
                        ),
                        hint: Text(
                          'Select',
                          style: TextStyle(
                            color: ConstColors.buttonColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        items: categoryItems
                            .map(
                              (item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    color: ConstColors.buttonColor,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          // setState(() {
                          //   selectedCategory = value.toString();
                          // });
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.only(right: 4, left: 4),
                        ),
                        iconStyleData: IconStyleData(
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: ConstColors.buttonColor,
                          ),
                          iconSize: 25,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          decoration: BoxDecoration(
                            color: ConstColors.itemColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const EnableNotification());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ConstColors.buttonColor,
                    ),
                    width: Get.width,
                    height: 55,
                    child: const Center(
                      child: Text(
                        'Complete Profile',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
