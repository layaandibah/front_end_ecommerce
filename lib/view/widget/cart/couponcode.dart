import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomCoupon extends StatelessWidget {
  final void Function()? onPressedApply;
  final TextEditingController? controllercoupon;
  const CustomCoupon({Key? key,required this.onPressedApply,required this.controllercoupon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      width: Get.width / 1.15,
      height: Get.height / 9.5,
      decoration: BoxDecoration(
        // gradient:Gradient(colors: [AppColor.primarycolor,AppColor.wightpurble]),
          borderRadius: BorderRadius.circular(20),
          border: Border.all()),
      child: Row(
        children: [
          Container(
            width: Get.width / 1.7,
            padding:const EdgeInsets.symmetric(horizontal: 5),
            child: TextFormField(
              controller: controllercoupon,
              cursorColor: AppColor.gray,
              decoration: InputDecoration(
                  hintText: "78".tr,
                  border:const OutlineInputBorder(
                      borderSide: BorderSide.none)),
            ),
          ),
          MaterialButton(
            onPressed: onPressedApply,
            height: 55,
            color: AppColor.primarycolor,
            highlightColor: AppColor.secoundcolor,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none),
            child: Text(
              "79".tr,
              style:const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: AppColor.wightpurble),
            ),
          )
        ],
      ),
    );
  }
}
