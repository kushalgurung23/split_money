import 'package:flutter/material.dart';

class PayButton extends StatelessWidget {
  final VoidCallback onPress;
  final Widget text;
  final Color color;
  final EdgeInsetsGeometry padding;
  const PayButton(
      {Key? key,
      required this.onPress,
      required this.text,
      required this.color,
      required this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Padding(
        padding: padding,
        child: text,
      ),
      style: TextButton.styleFrom(backgroundColor: color),
    );
  }
}
