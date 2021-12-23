import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_split_money/controller/cash_payment_controller.dart';
import 'package:third_split_money/model/split_option_model.dart';

class SplitOptionController extends GetxController {
  RxList<TextEditingController> amountTextEditingController =
      <TextEditingController>[].obs;
  RxList<String> paymentOptionController = <String>[].obs;
  final cashPaymentController = Get.find<CashPaymentController>();

  RxInt selectedPerson = 2.obs;
  RxList<String> paymentOption = ['Cash', 'Card', 'Online', 'Credits'].obs;
  late RxString selectedPaymentOption = paymentOption[0].obs;

  void addPerson() {
    if (selectedPerson >= 2 && selectedPerson <= 9) {
      selectedPerson++;
    }
  }

  void decreasePerson() {
    if (selectedPerson >= 3) {
      selectedPerson--;
    }
  }

  void splitPay({required SplitOptionModel splitOptionModel}) {
    SplitOptionModel splitOptionModelObj = splitOptionModel;
    if (cashPaymentController.totalAmount.value == 0) {
      Get.snackbar('Payment Status', 'Payment is already completed.');
    } else {
      if (splitOptionModel.paidAmount == 0.0) {
        Get.snackbar('Payment Unsuccessful', 'Please enter correct amount.',
            backgroundColor: Colors.deepOrangeAccent, colorText: Colors.black);
      } else if (cashPaymentController.totalAmount.value <
          splitOptionModelObj.paidAmount!.toDouble()) {
        Get.snackbar(
            'Payment Unsuccessful', 'Please enter remaining amount only.',
            backgroundColor: Colors.deepOrangeAccent, colorText: Colors.black);
      } else if (cashPaymentController.totalAmount.value > 0 &&
          cashPaymentController.totalAmount.value >=
              splitOptionModelObj.paidAmount!.toDouble()) {
        cashPaymentController.totalAmount.value =
            cashPaymentController.totalAmount.value -
                splitOptionModelObj.paidAmount!.toDouble();
        if (cashPaymentController.totalAmount.value == 0) {
          for (int i = 0; i < amountTextEditingController.length; i++) {
            amountTextEditingController[i].text = '';
          }
          cashPaymentController.cashReceived.value = 0;
          cashPaymentController.returnChange.value = 0;
          Get.snackbar('Payment Successful', 'Payment is complete. Thank you!',
              backgroundColor: Colors.green, colorText: Colors.white);
        }
      }
    }
  }
}
