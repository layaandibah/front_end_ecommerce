import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:ecommers/controller/homescreen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color.dart';

class BottomNavegationBarHome extends GetView<HomeScreenControllerImp> {
  const BottomNavegationBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          iconTheme: const IconThemeData(color: AppColor.wightpurble)),
      child: CurvedNavigationBar(
          items: controller.items,
          index: controller.index,
          height: 65,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: AppColor.secoundcolor.withOpacity(0.7),
          color: AppColor.primarycolor,
          animationCurve: Curves.easeOutCirc,
          onTap: (val) {
            controller.changeIndex(val);
          }),
    );
  }
}
