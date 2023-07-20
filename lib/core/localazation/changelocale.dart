import 'dart:ui';

import 'package:ecommers/core/constant/apptheme.dart';
import 'package:ecommers/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class MyLocal  extends GetxController{
  Locale? language;
  ThemeData theme=themeEnglish;
  MyServices services=Get.find();
  changelocale(String code)
  {
    Locale locale=Locale(code);
    code=="ar"?theme=themeArabic:theme=themeEnglish;
    services.sharedPreferences.setString("lang", code);
    Get.updateLocale(locale);
  }
  requestPermissionLocation()async{
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("تنبيه", "الرجاء منح الوصول إلى الموقع الجغرافي");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {

        return Get.snackbar("تنبيه", "الرجاء منح الوصول إلى الموقع الجغرافي");

      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Get.snackbar("تنبيه", "لا يمكن استخدام التطبيق من دون خدمة الموقع الجغرافي");

    }

  }

 @override
  void onInit() {
    requestPermissionLocation();
   String? lang= services.sharedPreferences.getString("lang");
   if(lang=="ar"){
     theme=themeArabic;
     language=const Locale("ar");
   }
   else if(lang=="en"){
     theme=themeEnglish;

     language=const Locale("en");
   }else {
     theme=themeEnglish;
     language=Get.deviceLocale;
   }
    super.onInit();
  }
}