import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_split_money/component/build_item_number_button.dart';
import 'package:third_split_money/controller/split_option_controller.dart';

class SplitOptionUpperBody extends StatelessWidget {
  SplitOptionUpperBody({Key? key}) : super(key: key);
  final splitOptionController = Get.find<SplitOptionController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        height: 100,
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BuildItemNumberButton(
                iconData: Icons.remove,
                onPress: () {
                  splitOptionController.decreasePerson();
                }),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => Text(
                      splitOptionController.selectedPerson.value.toString(),
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: 'RobotoBold',
                          color: Color(0xFF000000)),
                    )),
                const Text(
                  'Person(s)',
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'RobotoRegular',
                      color: Color(0xFF7A7A7A)),
                ),
              ],
            ),
            BuildItemNumberButton(
                iconData: Icons.add,
                onPress: () {
                  splitOptionController.addPerson();
                }),
          ],
        ),
      ),
    );
  }
}
