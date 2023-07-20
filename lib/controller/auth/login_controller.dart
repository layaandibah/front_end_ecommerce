import 'package:ecommers/core/class/statusrequest.dart';
import 'package:ecommers/core/constant/routes.dart';
import 'package:ecommers/core/function/handlingdata.dart';
import 'package:ecommers/core/services/services.dart';
import 'package:ecommers/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LogInController extends GetxController {
  login();

  goToSignUp();
  goToForgetPassword();
}

class LogInControllerImp extends LogInController {
  late TextEditingController email;
  late TextEditingController password;
 GlobalKey<FormState> formState=GlobalKey<FormState>();
  StatusRequest? statusrequest;
  LogInData logInData=LogInData(Get.find());
  MyServices myServices=Get.find();
  List data=[];
  @override
  goToSignUp() {
    Get.offNamed(AppRoutes.signup);
  }
  goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetpassword);
  }

  @override
  login()async {
    if(formState.currentState!.validate()){
      statusrequest=StatusRequest.loading;
      update();
      var res= await logInData.postData(email.text,password.text);
      statusrequest=handlingData(res);
      print("=======Data========");
      //فحص الفشل او النجاح بالوصول للسيرفر أو الانترنت
      if(StatusRequest.success==statusrequest){
        print("=======statusrequest========");

        //فحص الفشل بالباك اند
        if(res["status"]=="success"){
          myServices.sharedPreferences.setInt("id",res["data"]["users_id"]);
          myServices.sharedPreferences.setString("user_name",res["data"]["users_name"] );
          myServices.sharedPreferences.setString("user_email", res["data"]["users_email"]);
          myServices.sharedPreferences.setString("phone", res["data"]["users_phone"]);
          myServices.sharedPreferences.setString("step","2");
          Get.offNamed(AppRoutes.homepage);
        }else{
          //يوجد مشكلة في الباك اند
          Get.defaultDialog(title: "51".tr,middleText: "54".tr);
        }
      }
      update();

    }
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      String? token=value;
      print(token);
    } );
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
}
