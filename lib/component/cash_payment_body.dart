import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_split_money/component/constant.dart';
import 'package:third_split_money/component/pay_button.dart';
import 'package:third_split_money/controller/cash_payment_controller.dart';

class CashPaymentBody extends StatelessWidget {
  CashPaymentBody({Key? key}) : super(key: key);
  final cashPaymentController = Get.find<CashPaymentController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Theme.of(context).primaryColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Obx(() => cashPaymentController.totalAmount.value > 0
                ? Text(cashPaymentController.totalAmount.value.toString(),
                    style:
                        const TextStyle(fontSize: 21, fontFamily: 'RobotoBold'))
                : const Text('Thank you!',
                    style: TextStyle(fontSize: 21, fontFamily: 'RobotoBold'))),
          )),
          Center(
              child: Obx(() => cashPaymentController.totalAmount.value > 0
                  ? const Text('Total Amount',
                      style:
                          TextStyle(fontSize: 14, fontFamily: 'RobotoRegular'))
                  : const SizedBox())),
          const SizedBox(
            height: 40,
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: cashPaymentController.totalAmount.value > 0.0
                  ? const Text('Cash Received',
                      style:
                          TextStyle(fontSize: 14, fontFamily: 'RobotoRegular'))
                  : const Text('Return Change Amount',
                      style:
                          TextStyle(fontSize: 14, fontFamily: 'RobotoRegular')),
            ),
          ),
          Obx(() => cashPaymentController.cashReceived.value > 0.0
              ? Text('${cashPaymentController.cashReceived.value}',
                  style: const TextStyle(
                      fontSize: 14, fontFamily: 'RobotoRegular'))
              : Text(cashPaymentController.returnChange.value.toString(),
                  style: const TextStyle(
                      fontSize: 14, fontFamily: 'RobotoRegular'))),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Divider(
              color: Color(0xFFE0E0E0),
              thickness: 1.5,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: PayButton(
              color: kGreenColor,
              text: const Text('Confirm', style: cashButtonTextStyle),
              onPress: () {
                cashPaymentController.performTransaction();
              },
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
            ),
          )
        ],
      ),
    );
  }
}
