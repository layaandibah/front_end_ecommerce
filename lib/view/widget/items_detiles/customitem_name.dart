import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomItemName extends StatelessWidget {
  final String name;
  const CustomItemName({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
          fontSize: 30, color: AppColor.wightpurble, height: 0.0),
    );
  }
}
