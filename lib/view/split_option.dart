import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:third_split_money/component/split_option_body.dart';
import 'package:third_split_money/controller/cash_payment_controller.dart';

class SplitOption extends StatelessWidget {
  static const String id = '/split_option';

  final cashPaymentController = Get.find<CashPaymentController>();

  SplitOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0.0,
        backgroundColor: const Color(0xFFFFFFFF),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              CupertinoIcons.back,
              color: Colors.black,
            )),
        title: Obx(() => Text(
              'Remaining ' + cashPaymentController.totalAmount.value.toString(),
              style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'RobotoRegular',
                  fontSize: 16.0),
            )),
      ),
      body: const SplitOptionBody(),
    );
  }
}
