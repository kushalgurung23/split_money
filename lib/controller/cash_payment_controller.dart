import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_split_money/view/split_option.dart';

class CashPaymentController extends GetxController {
  RxDouble totalAmount = 220.0.obs;
  RxDouble cashReceived = 250.0.obs;
  RxDouble returnChange = 0.0.obs;

  void splitPayment() {
    totalAmount.value > 0
        ? Get.toNamed(SplitOption.id)
        : Get.snackbar('Payment Status', 'Payment is already completed.');
  }

  void performTransaction() {
    if (totalAmount.value <= 0.0) {
      Get.snackbar('Payment Status', 'Payment is already completed.');
    } else if (cashReceived.value >= totalAmount.value) {
      returnChange = (cashReceived.value - totalAmount.value).obs;
      Get.snackbar('Payment Successful', 'Payment is complete. Thank you!',
          backgroundColor: Colors.green, colorText: Colors.white);
      totalAmount.value = 0;
      cashReceived.value = 0;
    } else {
      returnChange.value = cashReceived.value - totalAmount.value;
      Get.snackbar('Payment Unsuccessful', 'Insufficient amount received.',
          backgroundColor: Colors.deepOrangeAccent, colorText: Colors.black);
    }
  }
}
