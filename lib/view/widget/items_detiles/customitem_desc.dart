import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomItemDesc extends StatelessWidget {
  final String descreption;
  const CustomItemDesc({Key? key, required this.descreption}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 160,
      child: Text(
        descreption,
        style: const TextStyle(fontSize: 13, color: AppColor.black),
        textAlign: TextAlign.center,
      ),
    );
  }
}
