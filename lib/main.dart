import 'package:ecommers/binding.dart';
import 'package:ecommers/core/localazation/changelocale.dart';
import 'package:ecommers/core/localazation/translation.dart';
import 'package:ecommers/core/services/services.dart';
import 'package:ecommers/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializ();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  MyLocal controller = Get.put(MyLocal());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: MyTranslation(),
      locale: controller.language,
      theme: controller.theme,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      //home: Language(),
      initialBinding: MyBinding(),
      // routes: routes,
      getPages: routes,
    );
  }
}
