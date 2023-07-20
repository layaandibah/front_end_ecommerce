import 'package:flutter/material.dart';

import '../../../controller/productdetiles_controller.dart';
import '../../../core/constant/color.dart';
import 'package:get/get.dart';

class CustomItemColor extends GetView<ProductDetilesControllerImp> {
  const CustomItemColor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...List.generate(
              controller.itemColor.length,
              (index) => Container(
                  width: controller.itemColor[index]["active"] == 1 ? 30 : 20,
                  height: controller.itemColor[index]["active"] == 1 ? 30 : 20,
                  decoration: BoxDecoration(
                      color: controller.itemColor[index]["name"] == "black"
                          ? AppColor.black
                          : controller.itemColor[index]["name"] == "red"
                              ? AppColor.red
                              : controller.itemColor[index]["name"] == "yellow"
                                  ? AppColor.gold
                                  : AppColor.wightpurble,
                      borderRadius: BorderRadius.circular(7)),
                  child: InkWell(
                    onTap: () {},
                  )))
        ],
      ),
    );
  }
}
