import 'package:ecommers/controller/auth/signup_controller.dart';
import 'package:ecommers/core/class/crud.dart';
import 'package:get/get.dart';

class MyBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp(),fenix: true);
    Get.put(Crud());

  }
}