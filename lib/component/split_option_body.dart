import 'package:flutter/material.dart';
import 'package:third_split_money/component/split_option_lower_body.dart';
import 'package:third_split_money/component/split_option_upper_body.dart';

class SplitOptionBody extends StatelessWidget {
  const SplitOptionBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          SplitOptionUpperBody(),
          const SizedBox(height: 40.0),
          SplitOptionLowerBody(),
        ],
      ),
    );
  }
}
