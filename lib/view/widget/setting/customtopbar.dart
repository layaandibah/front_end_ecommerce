import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import 'customclipper.dart';

class CustomTopBarImage extends StatelessWidget {
  const CustomTopBarImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      height: Get.height / 4,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          ClipPath(
              clipper: TopClipperSetting(),
              child: Container(color: AppColor.primarycolor)),
          Positioned(
              top: Get.height / 7.4,
              child: CircleAvatar(
                radius: 65,
                backgroundColor: AppColor.secoundcolor,
                backgroundImage: AssetImage(ImageAsset.avatar),
              ))
        ],
      ),
    );
  }
}
