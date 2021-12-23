import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_split_money/component/cash_payment_body.dart';
import 'package:third_split_money/controller/cash_payment_controller.dart';

class CashPayment extends StatelessWidget {
  static const String id = '/';
  final cashPaymentController = Get.find<CashPaymentController>();
  CashPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              titleSpacing: 0,
              elevation: 0.0,
              backgroundColor: const Color(0xFFFFFFFF),
              leading: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.back,
                    color: Colors.black,
                  )),
              title: const Text(
                'Cash Payment',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'RobotoRegular',
                    fontSize: 16.0),
              ),
              actions: [
                GestureDetector(
                  child: const Padding(
                    padding: EdgeInsets.only(right: 25.0),
                    child: Center(
                        child: Text(
                      'SPLIT',
                      style: TextStyle(
                          color: Color(0xFF30B700),
                          fontFamily: 'RobotoRegular',
                          fontSize: 16.0),
                    )),
                  ),
                  onTap: () {
                    cashPaymentController.splitPayment();
                  },
                ),
              ],
            ),
            body: CashPaymentBody()));
  }
}
