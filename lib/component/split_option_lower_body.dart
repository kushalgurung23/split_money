import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_split_money/component/pay_button.dart';
import 'package:third_split_money/component/payment_method_dropdown.dart';
import 'package:third_split_money/component/split_text_form_field.dart';
import 'package:third_split_money/controller/split_option_controller.dart';
import 'package:third_split_money/model/split_option_model.dart';
import 'constant.dart';

class SplitOptionLowerBody extends StatelessWidget {
  SplitOptionLowerBody({Key? key}) : super(key: key);
  final splitOptionController = Get.find<SplitOptionController>();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GetX<SplitOptionController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.selectedPerson.value,
            itemBuilder: (context, index) {
              int personCount = index + 1;
              String selectedDropDown = controller.selectedPaymentOption.value;
              controller.paymentOptionController.add(selectedDropDown);
              controller.amountTextEditingController
                  .add(TextEditingController());
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Person ${personCount.toString()}',
                        style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'RobotoBold',
                            color: Color(0xFF000000))),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                          color: Colors.grey, // Text colour here
                          width: 1.6, // Underline width
                        ))),
                        child: Obx(() => PaymentMethodDropdown(
                            value: controller.paymentOptionController[index],
                            valueChanged: (newValue) {
                              controller.paymentOptionController[index] =
                                  newValue.toString();
                            },
                            itemsList:
                                controller.paymentOption.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(valueItem),
                                ),
                              );
                            }).toList())),
                      ),
                    ),
                    SplitTextFormField(
                        hintText: 'Enter amount',
                        textEditingController:
                            controller.amountTextEditingController[index]),
                    const SizedBox(height: 10.0),
                    PayButton(
                      onPress: () {
                        String amountValue =
                            controller.amountTextEditingController[index].text;
                        splitOptionController.splitPay(
                            splitOptionModel: SplitOptionModel(
                                personNumber:
                                    'Person ${personCount.toString()}',
                                paymentMethod:
                                    controller.selectedPaymentOption.value,
                                paidAmount: amountValue.isEmpty
                                    ? 0.0
                                    : double.parse(amountValue)));
                      },
                      text: const Text('Pay',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'RobotoRegular',
                              color: Colors.white)),
                      color: kGreenColor,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    ),
                    const SizedBox(height: 25.0),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
