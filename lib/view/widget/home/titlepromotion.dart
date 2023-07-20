import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomPromotionTitle extends StatelessWidget {
  final String title;
  const CustomPromotionTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 10),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.primarycolor),
      ),
    );
  }
}
