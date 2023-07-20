import 'package:ecommers/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class CustomItemCounter extends StatelessWidget {
  final void Function()? onTapAdd;
  final void Function()? onTapRemove;
  final String counter;
  const CustomItemCounter(
      {Key? key, this.onTapAdd, this.onTapRemove, required this.counter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  color: AppColor.secoundcolor,
                  borderRadius: BorderRadius.circular(7)),
              child: InkWell(
                onTap: onTapAdd,
                child: const Icon(
                  size: 35,
                  Ionicons.add,
                  color: AppColor.wightpurble,
                ),
              )),
          Text(
            counter,
            style: const TextStyle(
                height: 0.0,
                fontSize: 35,
                color: AppColor.black,
                fontFamily: "Cairo"),
          ),
          Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  color: AppColor.fourthcolor,
                  borderRadius: BorderRadius.circular(7)),
              child: InkWell(
                onTap: onTapRemove,
                child: const Icon(
                  size: 35,
                  Ionicons.remove,
                  color: AppColor.wightpurble,
                ),
              )),
        ],
      ),
    );
  }
}
