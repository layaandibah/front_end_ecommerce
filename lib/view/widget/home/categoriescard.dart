import 'package:ecommers/controller/homepage_controller.dart';
import 'package:ecommers/core/function/translate_database.dart';
import 'package:ecommers/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../applinks.dart';
import '../../../core/constant/color.dart';

class CustomCategoriesCard extends GetView<HomePageControllerImp> {
  const CustomCategoriesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, i) {
            return Categories(
                i: i,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[i]));
          }),
    );
  }
}

class Categories extends GetView<HomePageControllerImp> {
  final int? i;
  final CategoriesModel categoriesModel;

  const Categories({
    Key? key,
    required this.categoriesModel,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i!, "${categoriesModel.categoriesId}");
      },
      child: Column(
        children: [
          Container(
              height: 70,
              width: 80,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                color: AppColor.thiredcolor.withOpacity(0.6),
                child: SvgPicture.network(
                  "${AppLinks.categoreisImages}/${categoriesModel.categoriesImage}",
                  color: AppColor.primarycolor,
                ),
              )),
          Text(
            "${translatDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColor.primarycolor),
          )
        ],
      ),
    );
  }
}
