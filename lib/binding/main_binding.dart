import 'package:get/get.dart';
import 'package:third_split_money/controller/cash_payment_controller.dart';
import 'package:third_split_money/controller/split_option_controller.dart';
import 'package:third_split_money/model/split_option_model.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplitOptionModel());
    Get.put(CashPaymentController());
    Get.put(SplitOptionController());
  }

}