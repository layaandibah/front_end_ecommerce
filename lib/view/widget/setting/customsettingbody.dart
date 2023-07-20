import 'package:ecommers/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSettingBody extends StatelessWidget {
  final void Function()? onTapLogOut;
  const CustomSettingBody({Key? key,required this.onTapLogOut}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const EdgeInsets.only(top:30,left: 10,right: 10 ),
      child: Column(
        children: [
          InkWell(onTap: (){},child: Card(margin:const EdgeInsets.symmetric(vertical: 5,),child: ListTile(title: Text("67".tr),trailing: Switch(value: true, onChanged: (val){}),),)),
          InkWell(onTap: (){Get.toNamed(AppRoutes.viewAddress);},child: Card(margin:const EdgeInsets.symmetric(vertical: 5,),child: ListTile(title: Text("68".tr),trailing:const Icon(Icons.location_on_outlined),),)),
          InkWell(onTap: (){},child: Card(margin:const EdgeInsets.symmetric(vertical: 5,),child: ListTile(title: Text("69".tr),trailing:const Icon(Icons.question_mark_rounded),),)),
          InkWell(onTap: (){},child: Card(margin:const EdgeInsets.symmetric(vertical: 5,),child: ListTile(title: Text("70".tr),trailing:const Icon(Icons.phone_callback_outlined),),)),
          InkWell(onTap: onTapLogOut,child: Card(margin:const EdgeInsets.symmetric(vertical: 5,),child: ListTile(title: Text("71".tr),trailing:const Icon(Icons.logout_outlined),),)),

        ],),
    );
  }
}
