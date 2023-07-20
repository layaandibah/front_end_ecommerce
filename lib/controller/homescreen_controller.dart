import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../view/screen/cart_page.dart';
import '../view/screen/home_page.dart';
import '../view/screen/notefication_page.dart';
import '../view/screen/profile_page.dart';
import '../view/screen/setting_page.dart';

abstract class HomeScreenController extends GetxController {
  changeIndex(int val);
  Widget changePage();
}

class HomeScreenControllerImp extends HomeScreenController {
  late int index;
  List<Widget> items = [
    const Icon(Ionicons.home_outline, size: 30),
    const Icon(Ionicons.notifications_outline, size: 30),
    const Icon(Ionicons.basket_outline, size: 30),
    const Icon(Ionicons.person_outline, size: 30),
    const Icon(Ionicons.settings_outline, size: 30),
  ];
  List pages = [
    const HomePage(),
    const NoteficationPage(),
    const CartPage(),
    const ProfilePage(),
    const SettingPage()
  ];
  @override
  changeIndex(val) {
    index = val;
    print("$index");
    update();
  }

  @override
  void onInit() {
    index = 0;
    super.onInit();
  }

  @override
  Widget changePage() {
    var page = pages[index];
    update();
    return page;
  }
}
