import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomBottonCurrentLocation extends StatelessWidget {
  final void Function()? onPressed;
  const CustomBottonCurrentLocation({Key? key,required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: AppColor.primarycolor,
          borderRadius: BorderRadius.circular(5)),
      child: IconButton(
        icon: const Icon(
          Icons.location_searching,
          color: AppColor.wightpurble,
          size: 20,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
