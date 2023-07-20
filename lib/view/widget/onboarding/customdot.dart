import 'package:ecommers/controller/onboardingcontroller.dart';
import 'package:ecommers/core/constant/color.dart';
import 'package:ecommers/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotOnBoarding extends StatelessWidget {
  const CustomDotOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(builder: (controller) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                    duration: const Duration(microseconds: 900),
                    width: controller.currentpage == index ? 20 : 6,
                    height: 6,
                    margin: const EdgeInsets.only(right: 4),
                    decoration: BoxDecoration(
                        color: AppColor.primarycolor,
                        borderRadius: BorderRadius.circular(10)),
                  )),
        ],
      );
    });
  }
}
