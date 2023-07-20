import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomItemButton extends StatelessWidget {
  final void Function()? onPressedAddToCart;
  final void Function()? onPressedGoToCart;
  const CustomItemButton(
      {Key? key, this.onPressedAddToCart, this.onPressedGoToCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: onPressedAddToCart,
          child: Container(
            alignment: Alignment.center,
            width: Get.width / 1.07,
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColor.primarycolor),
            child: Text(
              "64".tr,
              style: const TextStyle(
                  height: 0.0,
                  color: AppColor.wightpurble,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        // Container(
        //     alignment: Alignment.center,
        //     width: 50,
        //     height: 40,
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(15),
        //         color: AppColor.primarycolor),
        //     child: IconButton(
        //       onPressed:onPressedAddToCart ,
        //       icon: Icon(
        //         Ionicons.basket_outline,
        //         color: AppColor.wightpurble,
        //       ),
        //     ))
      ],
    );
  }
}
