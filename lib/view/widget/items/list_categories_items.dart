import 'package:ecommers/controller/items_controller.dart';
import 'package:ecommers/core/function/translate_database.dart';
import 'package:ecommers/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomListCategoriesItems extends StatelessWidget {
  const CustomListCategoriesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
        init: ItemsControllerImp(),
        builder: (controller) {
          return SizedBox(
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.categories.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Categories(
                          i: i,
                          categoriesModel: CategoriesModel.fromJson(
                              controller.categories[i])),
                    ],
                  );
                }),
          );
        });
  }
}

class Categories extends StatelessWidget {
  final int? i;
  final CategoriesModel categoriesModel;

  const Categories({
    Key? key,
    required this.categoriesModel,
    required this.i,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
        init: ItemsControllerImp(),
        builder: (controller) {
          return GestureDetector(
            onTap: () {
              controller.changCat(i!, "${categoriesModel.categoriesId}");
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.all(5),
              width: 110,
              height: 60,
              decoration: BoxDecoration(
                color: controller.slectedCat == i
                    ? AppColor.secoundcolor.withOpacity(0.3)
                    : AppColor.wightpurble,
                borderRadius: controller.slectedCat == i
                    ? BorderRadius.circular(15)
                    : BorderRadius.circular(10),
                border: controller.slectedCat == i
                    ? Border.all(color: AppColor.primarycolor, width: 2)
                    : Border.all(color: AppColor.secoundcolor, width: 2),
              ),
              child: Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "${translatDatabase(categoriesModel.categoriesNameAr, categoriesModel.categoriesName)}",
                  style: TextStyle(
                      height: 0.0,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: controller.slectedCat == i
                          ? AppColor.primarycolor
                          : AppColor.secoundcolor),
                ),
              ),
            ),
          );
        });
  }
}
