import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_sound_2/constant/constants.dart';
import 'package:mr_sound_2/controllers/playlist_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:mr_sound_2/controllers/show_end_widget_controller.dart';

List categoryItems = ['Public', 'Personal'];

final _focusNode = FocusNode();

void _toggleSearch() {
  Get.find<ShowEndWidget_SearchBar_Controller>().isSearchActive.value =
      !Get.find<ShowEndWidget_SearchBar_Controller>().isSearchActive.value;
  if (!Get.find<ShowEndWidget_SearchBar_Controller>().isSearchActive.value) {
    _focusNode.unfocus();
  }
}

class PlayList extends StatelessWidget {
  const PlayList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: SingleChildScrollView(
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
                    'Playlists',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: _toggleSearch,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: Get.find<ShowEndWidget_SearchBar_Controller>()
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
                              child:
                                  const Icon(Icons.search, color: Colors.white),
                            ),
                            Get.find<ShowEndWidget_SearchBar_Controller>()
                                    .isSearchActive
                                    .value
                                ? Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: TextField(
                                        autofocus: true,
                                        focusNode: _focusNode,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Type to search...",
                                          hintStyle:
                                              TextStyle(color: Colors.white70),
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
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.find<PlaylistController>().selectSongs.value = true;
                  Get.snackbar(
                    'Playlist',
                    'To create a playlist first choose your favorite songs.',
                    margin: const EdgeInsets.all(10),
                    icon: const Icon(
                      Icons.playlist_add_rounded,
                      size: 25,
                      color: Colors.white,
                    ),
                    colorText: Colors.white,
                    duration: const Duration(seconds: 5),
                  );
                },
                child: SizedBox(
                  width: Get.width,
                  height: 80,
                  child: Obx(
                    () => Row(
                      children: [
                        Container(
                          width: Get.width / 5,
                          height: Get.width / 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ConstColors.buttonColor,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              size: 30,
                              color: ConstColors.backgroundColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        const Text(
                          'Create Playlist',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                        const Spacer(),
                        Get.find<PlaylistController>().selectSongs.value
                            ? Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Get.find<PlaylistController>()
                                          .selectedIndexes
                                          .clear();
                                      Get.find<PlaylistController>()
                                          .selectSongs
                                          .value = false;
                                    },
                                    icon: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.redAccent,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Icon(
                                          Icons.close,
                                          size: 25,
                                          color: ConstColors.backgroundColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        if (Get.find<PlaylistController>()
                                                .selectedIndexes
                                                .length <
                                            3) {
                                          Get.snackbar(
                                            'Error',
                                            'Please add at least 3 Songs.',
                                            margin: const EdgeInsets.all(10),
                                            icon: const Icon(
                                              Icons.error_rounded,
                                              size: 25,
                                              color: Colors.orangeAccent,
                                            ),
                                            colorText: Colors.orangeAccent,
                                            duration:
                                                const Duration(seconds: 3),
                                          );
                                        } else {
                                          Get.bottomSheet(
                                            Container(
                                              width: Get.width,
                                              height: Get.height / 2,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight: Radius.circular(20),
                                                ),
                                                color:
                                                    ConstColors.backgroundColor,
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        16, 0, 16, 16),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      Divider(
                                                        indent: Get.width / 3,
                                                        endIndent:
                                                            Get.width / 3,
                                                        color: ConstColors
                                                            .buttonColor
                                                            .withAlpha(100),
                                                      ),
                                                      const SizedBox(
                                                        height: 4,
                                                      ),
                                                      Text(
                                                        'Name Your Playist',
                                                        style: TextStyle(
                                                          color: ConstColors
                                                              .buttonColor,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            'Title',
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: ConstColors
                                                                  .buttonColor,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: ConstColors
                                                              .buttonColor
                                                              .withAlpha(100),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      16),
                                                          child: TextFormField(
                                                            decoration:
                                                                const InputDecoration(
                                                              hintText:
                                                                  'Enter Title',
                                                              border:
                                                                  InputBorder
                                                                      .none,
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
                                                            'Description',
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: ConstColors
                                                                  .buttonColor,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: ConstColors
                                                              .buttonColor
                                                              .withAlpha(100),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      16),
                                                          child: TextFormField(
                                                            decoration:
                                                                const InputDecoration(
                                                              hintText:
                                                                  'Enter Short Description',
                                                              border:
                                                                  InputBorder
                                                                      .none,
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
                                                            'Visibility',
                                                            style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color: ConstColors
                                                                  .buttonColor,
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
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: ConstColors
                                                              .buttonColor
                                                              .withAlpha(100),
                                                        ),
                                                        child:
                                                            DropdownButtonFormField2(
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                          isExpanded: true,
                                                          decoration:
                                                              const InputDecoration(
                                                            iconColor:
                                                                Colors.white,
                                                            contentPadding:
                                                                EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            16),
                                                            border: InputBorder
                                                                .none,
                                                          ),
                                                          hint: Text(
                                                            'Category'.tr,
                                                            style: TextStyle(
                                                              color: ConstColors
                                                                  .backgroundColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          items: categoryItems
                                                              .map(
                                                                (item) =>
                                                                    DropdownMenuItem<
                                                                        String>(
                                                                  value: item,
                                                                  child: Text(
                                                                    item,
                                                                    style:
                                                                        TextStyle(
                                                                      color: ConstColors
                                                                          .backgroundColor,
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
                                                          buttonStyleData:
                                                              const ButtonStyleData(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    right: 4,
                                                                    left: 4),
                                                          ),
                                                          iconStyleData:
                                                              IconStyleData(
                                                            icon: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                right: 10,
                                                              ),
                                                              child: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: ConstColors
                                                                    .backgroundColor,
                                                              ),
                                                            ),
                                                            iconSize: 25,
                                                          ),
                                                          dropdownStyleData:
                                                              DropdownStyleData(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: ConstColors
                                                                  .buttonColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20),
                                                            ),
                                                          ),
                                                          menuItemStyleData:
                                                              const MenuItemStyleData(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        16),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 24,
                                                                bottom: 6),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                Get.back();
                                                                print('back');
                                                              },
                                                              child: Container(
                                                                width:
                                                                    Get.width /
                                                                        2.3,
                                                                height: 50,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                  color: ConstColors
                                                                      .buttonColor
                                                                      .withAlpha(
                                                                          100),
                                                                ),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    'Cancel',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                Get.back();
                                                                Get.find<
                                                                        PlaylistController>()
                                                                    .selectedIndexes
                                                                    .clear();
                                                                Get.find<
                                                                        PlaylistController>()
                                                                    .selectSongs
                                                                    .value = false;
                                                                Get.snackbar(
                                                                  'Successfull',
                                                                  'Your PlayList Created Successfully.',
                                                                  snackPosition:
                                                                      SnackPosition
                                                                          .BOTTOM,
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          10),
                                                                  icon:
                                                                      const Icon(
                                                                    Icons.check,
                                                                    size: 25,
                                                                    color: Colors
                                                                        .green,
                                                                  ),
                                                                  colorText:
                                                                      Colors
                                                                          .green,
                                                                  duration:
                                                                      const Duration(
                                                                          seconds:
                                                                              4),
                                                                );
                                                                //todo: add this playlist to all playlists and show to user
                                                              },
                                                              child: Container(
                                                                width:
                                                                    Get.width /
                                                                        2.3,
                                                                height: 50,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                  color: ConstColors
                                                                      .buttonColor,
                                                                ),
                                                                child:
                                                                    const Center(
                                                                  child: Text(
                                                                    'Create',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Colors
                                                                          .black,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                      icon: Icon(
                                        Icons.check,
                                        size: 25,
                                        color: ConstColors.backgroundColor,
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Obx(
                () => SizedBox(
                  height: Get.height - 260,
                  child: Get.find<PlaylistController>().selectSongs.value
                      ? ListView.separated(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                if (Get.find<PlaylistController>()
                                    .selectSongs
                                    .value) {
                                  if (Get.find<PlaylistController>()
                                      .selectedIndexes
                                      .contains(index)) {
                                    // remove from list
                                    Get.find<PlaylistController>()
                                        .selectedIndexes
                                        .remove(index);
                                  } else {
                                    // add to list
                                    Get.find<PlaylistController>()
                                        .selectedIndexes
                                        .add(index);
                                  }
                                }
                              },
                              child: Container(
                                height: 80,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: ConstColors.backgroundColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Obx(
                                  () => Row(
                                    children: [
                                      Stack(
                                        alignment: Alignment.bottomRight,
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
                                          Get.find<PlaylistController>()
                                                  .selectedIndexes
                                                  .contains(index)
                                              ? const Icon(
                                                  Icons.check_circle_sharp,
                                                  color: Colors.black,
                                                  size: 25,
                                                )
                                              : const SizedBox(),
                                        ],
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
                                        Icons.more_vert_outlined,
                                        color: Colors.white70,
                                        size: 25,
                                      ),
                                      const SizedBox(width: 4),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 14,
                          ),
                          itemCount: 10,
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
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
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Hate Monday',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          '32 Songs',
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.more_vert_outlined,
                                      color: Colors.white70,
                                      size: 25,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(
                            height: 14,
                          ),
                          itemCount: 10,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
