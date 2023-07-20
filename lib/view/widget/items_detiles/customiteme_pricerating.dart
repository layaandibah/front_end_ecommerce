import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomItemPriceRating extends StatelessWidget {
  final double price;
  final double newprice;
  final int discount;
  const CustomItemPriceRating(
      {Key? key,
      required this.price,
      required this.discount,
      required this.newprice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          discount == 0
              ? Text(
                  "$price \$",
                  style: TextStyle(
                      fontSize: 25,
                      color: AppColor.green,
                      height: 1,
                      fontFamily: "Cairo"),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${double.parse(newprice.toStringAsFixed(2))} \$",
                      style: TextStyle(
                          fontSize: 25, color: AppColor.green, height: 1),
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: "$price \$",
                            style: const TextStyle(
                              height: 0,
                              fontSize: 22,
                              color: AppColor.gray,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: AppColor.gray,
                              decorationStyle: TextDecorationStyle.solid,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
        ],
      ),
    );
  }
}
