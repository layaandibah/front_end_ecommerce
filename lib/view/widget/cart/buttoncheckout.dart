import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomButtonCheckOut extends StatelessWidget {
  final int numberOfItems;
  final String totalPrice;
  const CustomButtonCheckOut({Key? key, required this.numberOfItems, required this.totalPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: Get.width,
      height: Get.height/6,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [AppColor.primarycolor,AppColor.primarycolor.withOpacity(0.8),AppColor.secoundcolor]),
          borderRadius: BorderRadius.circular(30)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MaterialButton(
              height:50 ,
              color: AppColor.wightpurble,
              minWidth:200,
              shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none),
              child: Text("77".tr,style:const TextStyle(color: AppColor.primarycolor,fontSize: 20),),
              onPressed: (){}),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Total: $numberOfItems items",style:const TextStyle(color: AppColor.wightpurble,fontSize: 15),),
              Text("\$ $totalPrice",style:const TextStyle(color: AppColor.wightpurble,fontSize: 40,height: 0.0,fontFamily: "Cairo")),
            ],),
        ],),
    );
  }
}
