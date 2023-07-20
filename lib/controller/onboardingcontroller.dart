import 'package:ecommers/core/constant/routes.dart';
import 'package:ecommers/core/services/services.dart';
import 'package:ecommers/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();

  changedPage(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int currentpage = 0;
  MyServices myServices = Get.find();
  @override
  changedPage(int index) {
    currentpage = index;
    update();
  }

  @override
  next() {
    currentpage++;
    if (currentpage >= onBoardingList.length) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageController.animateToPage(currentpage,
          duration: const Duration(milliseconds: 700), curve: Curves.easeInOut);
    }
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
