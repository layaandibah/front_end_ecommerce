import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/color.dart';

class CustomBotton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const CustomBotton({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: Get.width / 1.07,
        height: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: AppColor.primarycolor),
        child: Text(
          text,
          style: const TextStyle(
              height: 0.0,
              color: AppColor.wightpurble,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
