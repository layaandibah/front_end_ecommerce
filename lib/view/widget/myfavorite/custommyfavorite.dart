import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommers/controller/myfavorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../applinks.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/translate_database.dart';
import '../../../data/model/favorite_model.dart';

class CustomMyFavorite extends StatelessWidget {
  final MyFavoriteModel itemsModel;

  const CustomMyFavorite({Key? key, required this.itemsModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyFavoriteController>(
        init: MyFavoriteController(),
        builder: (controller) {
          return InkWell(
            onTap: () {},
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Hero(
                      tag: "${itemsModel.itemsId}",
                      child: CachedNetworkImage(
                          imageUrl:
                              "${AppLinks.itemsImages}/${itemsModel.itemsImage}",
                          width: 170,
                          height: 170),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "62".tr,
                          style: TextStyle(
                              height: 0.0, color: AppColor.green, fontSize: 16),
                        ),
                        Row(
                          children: [
                            ...List.generate(
                                5,
                                (index) => const Icon(Ionicons.star_outline,
                                    size: 15, color: AppColor.yellow))
                          ],
                        )
                      ],
                    ),
                    Text(
                      "${translatDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
                      style: const TextStyle(
                          color: AppColor.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${itemsModel.itemsPrice} \$",
                          style: TextStyle(
                              height: 0.0,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppColor.green),
                        ),
                        IconButton(
                            onPressed: () {
                              controller
                                  .removeFavorite("${itemsModel.itemsId}");
                            },
                            icon: const Icon(
                              Icons.delete_outline_outlined,
                              color: AppColor.primarycolor,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
