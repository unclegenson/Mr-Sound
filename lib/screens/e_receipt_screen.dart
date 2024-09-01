import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mr_sound_2/constant/constants.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:mr_sound_2/screens/nav_screen.dart';

class EReceipt extends StatelessWidget {
  const EReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(12),
        child: GestureDetector(
          onTap: () async {
            Get.snackbar(
              'Start download',
              'E-Receipt pdf downloading...',
              margin: EdgeInsets.all(10),
              icon: Icon(
                Icons.file_download,
                size: 25,
                color: Colors.white,
              ),
              colorText: Colors.white,
              duration: Duration(seconds: 3),
              snackPosition: SnackPosition.BOTTOM,
            );
            await Future.delayed(
              Duration(seconds: 3),
              () {
                Get.snackbar(
                  'download finished',
                  'E-Receipt pdf downloadeded.',
                  margin: EdgeInsets.all(10),
                  icon: Icon(
                    Icons.download_done_rounded,
                    size: 25,
                    color: Colors.white,
                  ),
                  colorText: Colors.white,
                  duration: Duration(seconds: 3),
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
            );
            Get.to(() => NavScreen());
          },
          child: Container(
            width: Get.width,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: ConstColors.buttonColor,
            ),
            child: Center(
              child: Text(
                'Download E-Receipt',
                style: TextStyle(
                  color: Colors.white,
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
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
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
                      'E-Receipt',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      width: 10,
                    )
                  ],
                ),
                SizedBox(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Plan Details',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 17),
                          ),
                          Text(
                            'Yearly', //todo: enable change
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )
                        ],
                      ),
                      Divider(
                        height: 60,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.white70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Purchase Date',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 17),
                          ),
                          Text(
                            'December 24, 2023 | 10:00 AM', //todo: enable change
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Expiry Date',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 17),
                          ),
                          Text(
                            'December 24, 2023 | 10:00 AM', //todo: enable change
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )
                        ],
                      ),
                      Divider(
                        height: 60,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.white70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Amount',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 17),
                          ),
                          Text(
                            '99.99\$', //todo: enable change
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tax & Fees',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 17),
                          ),
                          Text(
                            '10.00\$', //todo: enable change
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )
                        ],
                      ),
                      Divider(
                        height: 60,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.white70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 17),
                          ),
                          Text(
                            '109.00\$', //todo: enable change
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )
                        ],
                      ),
                      Divider(
                        height: 60,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.white70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Name',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 17),
                          ),
                          Text(
                            'Mohammad Mahdi', //todo: enable change
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Phone Number',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 17),
                          ),
                          Text(
                            '+98 910 063 9128', //todo: enable change
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Payment Mode',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 17),
                          ),
                          Text(
                            'Paypal', //todo: enable change
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Transaction ID',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 17),
                          ),
                          Text(
                            '#RE2564HG23', //todo: enable change
                            style: TextStyle(color: Colors.white, fontSize: 17),
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
