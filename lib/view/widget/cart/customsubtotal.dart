import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSubTotalPrice extends StatelessWidget {
  final String subTotalPrice;
  final int discount;
  final double shipping;
  const CustomSubTotalPrice(
      {Key? key, required this.subTotalPrice, required this.discount, required this.shipping})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: Get.height / 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("75".tr),
              Text(
                "\$ $subTotalPrice",
                style: const TextStyle(
                    fontSize: 20, height: 0.0, fontFamily: "Cairo"),
              )
            ],
          ), Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("76".tr),
              Text(
                "\$ $shipping",
                style: const TextStyle(
                  fontSize: 20,
                  height: 0.0,
                  fontFamily: "Cairo",
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("82".tr),
              Text(
                "% $discount",
                style: const TextStyle(
                  fontSize: 20,
                  height: 0.0,
                  fontFamily: "Cairo",
                ),
              )
            ],
          ),

          const Divider(thickness: 2),
        ],
      ),
    );
  }
}
