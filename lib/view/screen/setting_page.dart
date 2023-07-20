import 'package:ecommers/controller/settings_controller.dart';
import 'package:ecommers/view/widget/setting/customsettingbody.dart';
import 'package:ecommers/view/widget/setting/customtopbar.dart';
import 'package:ecommers/view/widget/setting/customusername.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingControllerImp controller = Get.put(SettingControllerImp());
    return ListView(
      children: [
        const CustomTopBarImage(),
        CustomUserNameEmail(name: controller.name, email: controller.email),
        CustomSettingBody(onTapLogOut: () {
          controller.logOut();
        })
      ],
    );
  }
}
