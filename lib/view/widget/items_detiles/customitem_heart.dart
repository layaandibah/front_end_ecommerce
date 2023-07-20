import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../core/constant/color.dart';

class CustomItemHeart extends StatelessWidget {
  final void Function()? onPressed;
  const CustomItemHeart({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  IconButton(
        onPressed:onPressed ,
        icon: const Icon(
          Ionicons.heart_outline,
          color: AppColor.wightpurble,
          size: 40,
        ));
  }
}
