import 'package:ecommers/controller/onboardingcontroller.dart';
import 'package:ecommers/core/constant/color.dart';
import 'package:ecommers/view/widget/onboarding/custombutton.dart';
import 'package:ecommers/view/widget/onboarding/customdot.dart';
import 'package:ecommers/view/widget/onboarding/customslider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      backgroundColor: AppColor.wightpurble,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(flex: 4, child: CustomSliderOnBoarding()),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomDotOnBoarding(),
                  Spacer(
                    flex: 1,
                  ),
                  CustumButtonOnboarding(),
                ],
              ))
        ],
      )),
    );
  }
}
