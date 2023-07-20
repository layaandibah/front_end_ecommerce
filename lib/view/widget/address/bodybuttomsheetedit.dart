import 'package:ecommers/controller/address/editaddress_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../../core/constant/routes.dart';
import '../../../core/function/validator.dart';
import '../../../core/shared/custombotton.dart';
import '../auth/customtextformfaild.dart';

class CustomButtomSheetEdit extends GetView<EditAddressControllerImp> {
  const CustomButtomSheetEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
          bottom: 10,
          child:   CustomBotton(onTap: (){ controller.markers.length!=0?
          Get.bottomSheet(
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                height: Get.height/2,
                child:Form(
                  key: controller.key,
                  child: ListView(
                      children: [
                        Column(
                          children: [
                            Text("Address detiles",style: TextStyle(color: AppColor.primarycolor,fontSize: 20),textAlign: TextAlign.center,),
                            SizedBox(height: 20,),
                            CustomTextFormFaild(titletext: "name", hinttext: "", suffixicon: Icon(Icons.location_on_outlined), textEditingController: controller.name!, validator: (val){return valid(val!, 3, 50, "text");}, keyboardType:TextInputType.text ),
                            CustomTextFormFaild(titletext: "city", hinttext: "", suffixicon: Icon(Icons.location_city_outlined), textEditingController: controller.city!, validator: (val){return valid(val!, 3, 50, "text");}, keyboardType:TextInputType.text ),
                            CustomTextFormFaild(titletext: "street", hinttext: "", suffixicon: Icon(Icons.location_on_outlined), textEditingController: controller.street!, validator: (val){return valid(val!, 3, 50, "text");}, keyboardType:TextInputType.text ),
                            SizedBox(height: 20,),
                            CustomBotton(onTap: ()async{
                              Get.back();
                              await controller.editAddress();
                              Get.offNamed(AppRoutes.viewAddress);
                            }, text: "85".tr )],),]
                  ),
                ),
              ),
          elevation: 0,
          isDismissible: false,
          backgroundColor: AppColor.wightpurble,
          shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
            topRight:
            Radius.circular(20)))):Get.snackbar("51".tr, "84".tr,snackPosition: SnackPosition.BOTTOM);}, text:"4".tr,)
      );
  }
}




