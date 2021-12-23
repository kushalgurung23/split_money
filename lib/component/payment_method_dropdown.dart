import 'package:flutter/material.dart';

class PaymentMethodDropdown extends StatelessWidget {
  final String value;
  final ValueChanged valueChanged;
  final List<DropdownMenuItem<String>> itemsList;

  const PaymentMethodDropdown(
      {Key? key,
      required this.value,
      required this.valueChanged,
      required this.itemsList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      child: DropdownButton(
        isExpanded: true,
        hint: const Text("Select payment"),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black,
        ),
        iconSize: 36.0,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
        value: value,
        onChanged: valueChanged,
        items: itemsList,
        underline: const SizedBox(),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      alignedDropdown: true,
    );
  }
}
