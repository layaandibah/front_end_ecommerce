import 'package:ecommers/controller/homepage_controller.dart';
import 'package:ecommers/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBoxDiscount extends GetView<HomePageControllerImp> {
  final String title;
  final String body;
  const CustomBoxDiscount({Key? key, required this.title, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.primarycolor,
              ),
              height: 150,
              child: ListTile(
                title: Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20, color: AppColor.wightpurble),
                ),
                subtitle: Text(body,
                    style: const TextStyle(
                        fontSize: 35, color: AppColor.wightpurble)),
              )),
          Positioned(
              bottom: 20,
              right: controller.lang == "en" ? -18 : null,
              left: controller.lang == "ar" ? -18 : null,
              child: Container(
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColor.thiredcolor,
                ),
              ))
        ],
      ),
    );
  }
}
