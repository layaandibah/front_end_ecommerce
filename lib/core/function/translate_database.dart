import 'package:ecommers/core/services/services.dart';
import 'package:get/get.dart';

translatDatabase(culomnar,culomnen){
  MyServices myServices=Get.find();
  if(myServices.sharedPreferences.getString("lang")=="ar"){
    return culomnar;
  }else{
    return culomnen;
  }
}