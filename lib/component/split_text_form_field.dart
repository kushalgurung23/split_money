import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:third_split_money/component/constant.dart';

class SplitTextFormField extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  const SplitTextFormField(
      {Key? key, required this.hintText, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
          fontSize: 14, fontFamily: 'RobotoRegular', color: Color(0xFF000000)),
      maxLines: 1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        focusColor: kGreenColor,
        hintStyle: const TextStyle(
          fontFamily: 'RobotoRegular',
        ),
        hintText: hintText,
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF7A7A7A), width: 1.2)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: kGreenColor)),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      controller: textEditingController,
    );
  }
}
