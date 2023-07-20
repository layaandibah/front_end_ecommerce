import 'package:ecommers/controller/homepage_controller.dart';
import 'package:ecommers/core/function/translate_database.dart';
import 'package:ecommers/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../applinks.dart';
import '../../../core/constant/color.dart';

class CustomItemsHome extends StatelessWidget {
  const CustomItemsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageControllerImp>(
        init: HomePageControllerImp(),
        builder: (controller) {
          return SizedBox(
              height: 180,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.items.length,
                  itemBuilder: (context, i) {
                    return ItemsHome(
                        itemsModel: ItemsModel.fromJson(controller.items[i]),
                        onTapItems: () {
                          controller.goToItemsDetiles(
                              controller.items[i]["items_id"].toString());
                        });
                  }));
        });
  }
}

class ItemsHome extends StatelessWidget {
  final ItemsModel itemsModel;
  final void Function()? onTapItems;

  const ItemsHome(
      {Key? key, required this.itemsModel, required this.onTapItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapItems,
      child: Stack(children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          height: 180,
          width: 220,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
          child: Image.network(
            "${AppLinks.itemsImages}/${itemsModel.itemsImage}",
            fit: BoxFit.fill,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.center,
          height: 180,
          width: 230,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColor.fourthcolor.withOpacity(0.3)),
        ),
        Positioned(
            right: 13,
            child: Text(
              "${translatDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: AppColor.primarycolor.withOpacity(0.7)),
            ))
      ]),
    );
  }
}
