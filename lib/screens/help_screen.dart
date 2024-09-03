import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_sound_2/constant/constants.dart';
import 'package:mr_sound_2/controllers/expand_container_controller.dart';
import 'package:mr_sound_2/controllers/help_bubble.dart';

List helpBubbles = ['All', 'Services', 'General', 'Account'];
List faqIcons = [
  Icons.language,
  Icons.call,
  Icons.facebook,
  Icons.alternate_email_outlined,
  Icons.telegram
];
List faqTitles = ['Website', 'Call - Message', 'Facebook', 'Email', 'Telegram'];
List faqItems = [
  'https://unclegenson.com',
  '+98 910 063 9128',
  '@unclegenson',
  'unclegenson@gmail.com',
  '@UncleGenSon'
];

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ConstColors.backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
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
                        'Help Center',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Container(
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
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 50,
                    width: Get.width,
                    child: TabBar(
                      indicatorColor: ConstColors.buttonColor,
                      dividerColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Tab(
                          child: Text(
                            "FAQ",
                            style: TextStyle(
                                fontSize: 18, color: ConstColors.buttonColor),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Contact Us",
                            style: TextStyle(
                                fontSize: 18, color: ConstColors.buttonColor),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: Get.width,
                    height: Get.height * 7 / 10,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 40,
                              width: Get.width,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Obx(
                                    () => GestureDetector(
                                      onTap: () {
                                        Get.find<HelpBubbleController>()
                                            .bubbleIndex
                                            .value = index;
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: index ==
                                                  Get.find<
                                                          HelpBubbleController>()
                                                      .bubbleIndex
                                                      .value
                                              ? ConstColors.buttonColor
                                              : ConstColors.itemColor,
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Text(
                                              helpBubbles[index],
                                              style: TextStyle(
                                                color: index ==
                                                        Get.find<
                                                                HelpBubbleController>()
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
                                itemCount: helpBubbles.length,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: Get.height * 6 / 10 + 30,
                              width: Get.width,
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.find<ExpandContainerController>()
                                            .index
                                            .value = index;
                                      },
                                      child: Obx(
                                        () => AnimatedContainer(
                                          duration:
                                              const Duration(milliseconds: 300),
                                          height:
                                              Get.find<ExpandContainerController>()
                                                          .index
                                                          .value ==
                                                      index
                                                  ? 110
                                                  : 50,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 12,
                                                      horizontal: 12),
                                              child: Get.find<ExpandContainerController>()
                                                          .index
                                                          .value ==
                                                      index
                                                  ? const SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                'What are the premium subscription plans?',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                            color:
                                                                Colors.white54,
                                                            thickness: 0.3,
                                                            indent: 10,
                                                            endIndent: 10,
                                                          ),
                                                          Text(
                                                            'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.',
                                                            maxLines: 3,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .white70,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  : const Row(
                                                      children: [
                                                        Text(
                                                          'What are the premium subscription plans?',
                                                          style: TextStyle(
                                                            fontSize: 14,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: 10,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Get.height * 7 / 10,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Get.find<ExpandContainerController>()
                                        .index
                                        .value = index;
                                  },
                                  child: Obx(
                                    () => AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      height:
                                          Get.find<ExpandContainerController>()
                                                      .index
                                                      .value ==
                                                  index
                                              ? 85
                                              : 50,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2, horizontal: 2),
                                          child:
                                              Get.find<ExpandContainerController>()
                                                          .index
                                                          .value ==
                                                      index
                                                  ? SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            child: Row(
                                                              children: [
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Icon(
                                                                  faqIcons[
                                                                      index],
                                                                  color: Colors
                                                                      .white,
                                                                  size: 25,
                                                                ),
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  faqTitles[
                                                                      index],
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        14,
                                                                  ),
                                                                ),
                                                                const Spacer(),
                                                                const Icon(
                                                                  Icons
                                                                      .arrow_forward_ios_sharp,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 20,
                                                                ),
                                                                const SizedBox(
                                                                  width: 10,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const Divider(
                                                            color:
                                                                Colors.white70,
                                                            indent: 10,
                                                            endIndent: 10,
                                                            thickness: 0.3,
                                                          ),
                                                          Row(
                                                            children: [
                                                              const SizedBox(
                                                                width: 10,
                                                              ),
                                                              Text(
                                                                faqItems[index],
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    )
                                                  : Container(
                                                      child: Row(
                                                        children: [
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Icon(
                                                            faqIcons[index],
                                                            color: Colors.white,
                                                            size: 25,
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                          Text(
                                                            faqTitles[index],
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          const Icon(
                                                            Icons
                                                                .arrow_forward_ios_sharp,
                                                            color: Colors.white,
                                                            size: 20,
                                                          ),
                                                          const SizedBox(
                                                            width: 10,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: 5,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
