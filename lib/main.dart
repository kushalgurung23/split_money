import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:third_split_money/view/cash_payment.dart';
import 'package:third_split_money/view/split_option.dart';
import 'binding/main_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Split Money',
      theme: ThemeData(
        primaryColor: const Color(0xFFF4F4F4),
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
            name: CashPayment.id,
            page: () => CashPayment(),
            binding: MainBinding()),
        GetPage(name: SplitOption.id, page: () => SplitOption()),
      ],
    );
  }
}
