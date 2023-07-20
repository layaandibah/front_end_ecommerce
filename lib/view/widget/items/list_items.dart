import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommers/controller/items_controller.dart';
import 'package:ecommers/core/class/handlingdataview.dart';
import 'package:ecommers/core/constant/imageasset.dart';
import 'package:ecommers/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../applinks.dart';
import '../../../controller/favorite_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/function/translate_database.dart';

class CustomListItems extends StatelessWidget {
  const CustomListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoriteController controllerFav = Get.put(FavoriteController());
    return GetBuilder<ItemsControllerImp>(
        init: ItemsControllerImp(),
        builder: (controller) {
          return SizedBox(
            height: 650,
            child: HandlingDataView(
              statusrequest: controller.statusRequest,
              widget: GridView.builder(
                  physics: const ScrollPhysics(),
                  itemCount: controller.items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.6),
                  itemBuilder: (BuildContext context, i) {
                    controllerFav.isFavorite[controller.items[i]["items_id"]] =
                        controller.items[i]["favorite"];
                    return Items(
                        itemsModel: ItemsModel.fromJson(controller.items[i]));
                  }),
            ),
          );
        });
  }
}

class Items extends StatelessWidget {
  final ItemsModel itemsModel;

  const Items({Key? key, required this.itemsModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(
        init: ItemsControllerImp(),
        builder: (controller) {
          return InkWell(
            onTap: () {
              controller.goToProductDetiles("${itemsModel.itemsId}");
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Hero(
                          tag: "${itemsModel.itemsId}",
                          child: CachedNetworkImage(
                              imageUrl:
                                  "${AppLinks.itemsImages}/${itemsModel.itemsImage}",
                              width: 179,
                              height: 179),
                        ),
                        if (itemsModel.itemsDiscount! > 0)
                          Positioned(
                            bottom: 0,
                            right: 5,
                            child: Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: AppColor.redAccent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                "${itemsModel.itemsDiscount}%",
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: AppColor.wightpurble,
                                    height: 0),
                                textAlign: TextAlign.center,
                              )),
                            ),
                          ),
                        if (itemsModel.itemsDiscount! > 0)
                          Positioned(
                            top: -16,
                            left: -56,
                            child: SizedBox(
                                width: Get.height / 4.2,
                                height: Get.width / 4.2,
                                // decoration: BoxDecoration(
                                //     color: AppColor.green,
                                //     borderRadius: BorderRadius.circular(10)),
                                child: Image.asset(ImageAsset.itemoffers)
                                // Center(
                                //     child: Text(
                                //       "82".tr,
                                //       style:const TextStyle(
                                //           fontSize: 15, color: AppColor.wightpurble, height: 0),
                                //       textAlign: TextAlign.center,
                                //     )),
                                ),
                          ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 5, right: 5),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // Text(
                              //   "62".tr,
                              //   style: TextStyle(
                              //       height: 0.0, color: AppColor.green, fontSize: 16),
                              // ),
                              Row(
                                children: [
                                  ...List.generate(
                                      5,
                                      (index) => Icon(Ionicons.star_outline,
                                          size: 15, color: AppColor.gold))
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
                              itemsModel.itemsDiscount == 0
                                  ? Text(
                                      "${itemsModel.itemsPrice} \$",
                                      style: TextStyle(
                                          height: 0.0,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.green,
                                          fontFamily: "cairo"),
                                    )
                                  : Column(
                                      children: [
                                        Text(
                                          "${double.parse(itemsModel.itemsPriceDiscount!.toStringAsFixed(2))} \$",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: AppColor.green,
                                              height: 0),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: <TextSpan>[
                                              TextSpan(
                                                text:
                                                    "${itemsModel.itemsPrice} \$",
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: AppColor.gray,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  decorationColor:
                                                      AppColor.gray,
                                                  decorationStyle:
                                                      TextDecorationStyle.solid,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                              GetBuilder<FavoriteController>(
                                  init: FavoriteController(),
                                  builder: (controller) {
                                    return IconButton(
                                        onPressed: () {
                                          if (controller.isFavorite[
                                                  itemsModel.itemsId] ==
                                              1) {
                                            controller.setFavorite(
                                                itemsModel.itemsId, 0);
                                            controller.removeFavorite(
                                                "${itemsModel.itemsId}");
                                          } else {
                                            controller.setFavorite(
                                                itemsModel.itemsId, 1);
                                            controller.addFavorite(
                                                "${itemsModel.itemsId}");
                                          }
                                        },
                                        icon: Icon(
                                          controller.isFavorite[
                                                      itemsModel.itemsId] ==
                                                  1
                                              ? Ionicons.heart
                                              : Ionicons.heart_outline,
                                          color: AppColor.red,
                                        ));
                                  })
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
