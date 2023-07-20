import 'package:ecommers/controller/homescreen_controller.dart';
import 'package:ecommers/view/widget/bottomnavigationbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/function/exitapp.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(builder: (controller) {
      return WillPopScope(onWillPop: exitDialog, child: Scaffold(
        extendBody: true,
        bottomNavigationBar: const BottomNavegationBarHome(),
        body: controller.changePage(),
      ));
    });
  }
}
