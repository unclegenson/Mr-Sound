import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mr_sound_2/constant/constants.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:mr_sound_2/screens/nav_screen.dart';

class EReceipt extends StatelessWidget {
  const EReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12),
        child: GestureDetector(
          onTap: () async {
            Get.snackbar(
              'Start download',
              'E-Receipt pdf downloading...',
              margin: const EdgeInsets.all(10),
              icon: const Icon(
                Icons.file_download,
                size: 25,
                color: Colors.white,
              ),
              colorText: Colors.white,
              duration: const Duration(seconds: 3),
              snackPosition: SnackPosition.BOTTOM,
            );
            await Future.delayed(
              const Duration(seconds: 3),
              () {
                Get.snackbar(
                  'download finished',
                  'E-Receipt pdf downloadeded.',
                  margin: const EdgeInsets.all(10),
                  icon: const Icon(
                    Icons.download_done_rounded,
                    size: 25,
                    color: Colors.white,
                  ),
                  colorText: Colors.white,
                  duration: const Duration(seconds: 3),
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            );
            Get.offAll(() => const NavScreen());
          },
          child: Container(
            width: Get.width,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ConstColors.buttonColor,
            ),
            child: Center(
              child: Text(
                'Download E-Receipt',
                style: TextStyle(
                  color: ConstColors.backgroundColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
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
                      'E-Receipt',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
                const SizedBox(
                  height: 18,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                        child: BarcodeWidget(
                          data: '#RE2564HG23',
                          barcode: Barcode.code128(),
                          color: Colors.white,
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Plan Details',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 17),
                          ),
                          Text(
                            'Yearly', //todo: enable change
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                      const Divider(
                        height: 60,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.white70,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Purchase Date',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 15),
                          ),
                          Text(
                            'December 24, 2023 | 10:00 AM', //todo: enable change
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Expiry Date',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 17),
                          ),
                          Text(
                            'December 24, 2024 | 10:00 AM', //todo: enable change
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                      const Divider(
                        height: 60,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.white70,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Amount',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 17),
                          ),
                          Text(
                            '99.99\$', //todo: enable change
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tax & Fees',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 17),
                          ),
                          Text(
                            '10.00\$', //todo: enable change
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                      const Divider(
                        height: 60,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.white70,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 17),
                          ),
                          Text(
                            '109.00\$', //todo: enable change
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                      const Divider(
                        height: 60,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.white70,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Name',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 17),
                          ),
                          Text(
                            'Mohammad Mahdi', //todo: enable change
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Phone Number',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 17),
                          ),
                          Text(
                            '+98 910 063 9128', //todo: enable change
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Payment Mode',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 17),
                          ),
                          Text(
                            'Paypal', //todo: enable change
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transaction ID',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 17),
                          ),
                          Text(
                            '#RE2564HG23', //todo: enable change
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                        ],
                      ),
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
}
