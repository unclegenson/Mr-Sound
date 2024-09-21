import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:get/get.dart';
import 'package:mr_sound_2/constant/constants.dart';
import 'package:mr_sound_2/screens/success_pay_screen.dart';

class MySample extends StatefulWidget {
  const MySample({super.key});

  @override
  State<StatefulWidget> createState() => MySampleState();
}

bool isCvvFocused = false;
String cardNumber = '';
String expiryDate = '';
String cardHolderName = '';
String cvvCode = '';

final OutlineInputBorder border = OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.grey.withOpacity(0.7),
    width: 2.0,
  ),
);

class MySampleState extends State<MySample> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
        child: GestureDetector(
          onTap: _onValidate,
          child: Container(
            height: 50,
            width: Get.width,
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: ConstColors.buttonColor,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Center(
              child: Text(
                'Add Card',
                style: TextStyle(
                  color: ConstColors.backgroundColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: ConstColors.backgroundColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: SizedBox(
              width: Get.width,
              height: Get.height * 4 / 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
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
                        'Add Card',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  CreditCardWidget(
                    enableFloatingCard: false,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    bankName: 'Bank Name',
                    frontCardBorder: Border.all(color: Colors.white),
                    backCardBorder: Border.all(color: Colors.white),
                    showBackView: isCvvFocused,
                    obscureCardNumber: true,
                    obscureCardCvv: true,
                    isHolderNameVisible: true,
                    cardBgColor: ConstColors.buttonColor,
                    isSwipeGestureEnabled: true,
                    onCreditCardWidgetChange:
                        (CreditCardBrand creditCardBrand) {},
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          CreditCardForm(
                            formKey: formKey,
                            obscureCvv: true,
                            obscureNumber: true,
                            cardNumber: cardNumber,
                            cvvCode: cvvCode,
                            isHolderNameVisible: true,
                            isCardNumberVisible: true,
                            isExpiryDateVisible: true,
                            cardHolderName: cardHolderName,
                            expiryDate: expiryDate,
                            inputConfiguration: InputConfiguration(
                              cvvCodeTextStyle:
                                  const TextStyle(color: Colors.white),
                              cardHolderTextStyle:
                                  const TextStyle(color: Colors.white),
                              cardNumberTextStyle:
                                  const TextStyle(color: Colors.white),
                              expiryDateTextStyle:
                                  const TextStyle(color: Colors.white),
                              cardNumberDecoration: InputDecoration(
                                labelText: 'Number',
                                hintStyle: const TextStyle(color: Colors.white),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                                hintText: 'XXXX XXXX XXXX XXXX',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ConstColors.buttonColor),
                                ),
                              ),
                              expiryDateDecoration: InputDecoration(
                                labelText: 'Expired Date',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ConstColors.buttonColor),
                                ),
                                hintText: 'XX/XX',
                                hintStyle: const TextStyle(color: Colors.white),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                              ),
                              cvvCodeDecoration: InputDecoration(
                                labelText: 'CVV',
                                hintText: 'XXX',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ConstColors.buttonColor),
                                ),
                                hintStyle: const TextStyle(color: Colors.white),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                              ),
                              cardHolderDecoration: InputDecoration(
                                labelText: 'Card Holder',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ConstColors.buttonColor),
                                ),
                                hintStyle: const TextStyle(color: Colors.white),
                                labelStyle:
                                    const TextStyle(color: Colors.white),
                              ),
                            ),
                            onCreditCardModelChange: onCreditCardModelChange,
                          ),
                        ],
                      ),
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

  void _onValidate() {
    if (formKey.currentState?.validate() ?? false) {
      Get.to(() => const SuccessPay());
    } else {
      print('invalid!');
    }
  }

  void onCreditCardModelChange(CreditCardModel creditCardModel) {
    setState(() {
      cardNumber = creditCardModel.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
