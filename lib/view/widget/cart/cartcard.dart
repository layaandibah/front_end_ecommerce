import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommers/applinks.dart';
import 'package:ecommers/controller/cart_controller.dart';
import 'package:ecommers/core/function/translate_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../../data/model/cartmodel.dart';

class CustomCartCard extends StatelessWidget {
  final CartModel cartModel;
  final int index;
  const CustomCartCard({Key? key, required this.cartModel, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
        init: CartControllerImp(),
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                const Positioned(
                    left: 2,
                    top: -13,
                    child: Icon(
                      Icons.highlight_remove_outlined,
                      size: 25,
                    )),
                Container(
                  height: Get.height / 6,
                  margin:
                      const EdgeInsets.only(bottom: 15, left: 13, right: 13),
                  decoration: BoxDecoration(
                      color: AppColor.thiredcolor.withOpacity(0.11),
                      borderRadius: BorderRadius.circular(15)),
                ),
                Positioned(
                  right: 20,
                  child: Container(
                    height: Get.height / 9,
                    width: Get.width / 3.2,
                    decoration: BoxDecoration(
                        color: AppColor.wightpurble,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Positioned(
                    right: 25,
                    bottom: -30,
                    child: CachedNetworkImage(
                      imageUrl:
                          "${AppLinks.itemsImages}/${cartModel.itemsImage}",
                      height: Get.height / 3.4,
                      width: Get.width / 3.4,
                    )),
                if (cartModel.itemsDiscount! > 0)
                  Positioned(
                      right: 20,
                      bottom: -50,
                      child: Image.asset(ImageAsset.itemdetilesoffers,
                          height: Get.height / 3.1,
                          width: Get.width / 3.1,
                          opacity: const AlwaysStoppedAnimation<double>(0.3))),
                Positioned(
                    right: Get.width / 2.6,
                    top: 17,
                    child: Text(
                      translatDatabase(
                          cartModel.itemsNameAr, cartModel.itemsName),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          height: 0.0,
                          color: AppColor.black),
                    )),
                Positioned(
                  left: 20,
                  bottom: 35,
                  child: Container(
                    height: Get.height / 20,
                    width: Get.width / 2.7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 1.4, color: AppColor.primarycolor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () async {
                              await controller.addCart("${cartModel.itemsId}",
                                  "${controller.count[index]}");
                              await controller.add(index);
                            },
                            icon: const Icon(Icons.add)),
                        GetBuilder<CartControllerImp>(
                            init: CartControllerImp(),
                            builder: (controller) {
                              return Text("${controller.count[index]}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23,
                                      height: 1.7,
                                      color: AppColor.black,
                                      fontFamily: "Cairo"));
                            }),
                        IconButton(
                            onPressed: () async {
                              await controller.deleteCart(
                                  "${cartModel.itemsId}",
                                  "${controller.count[index]}");
                              await controller.delete(index);
                              if (controller.count[index] == 0) {
                                await controller.deleteCart(
                                    "${cartModel.itemsId}",
                                    "${controller.count[index]}");
                                await controller.refreshPage();
                              }
                            },
                            icon: const Icon(Icons.remove)),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    right: Get.width / 2.6,
                    bottom: 45,
                    child: Text(
                      "${double.parse(controller.subprice[index].toString()).toStringAsFixed(2)}\$",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          height: 1.0,
                          color: AppColor.primarycolor,
                          fontFamily: "Cairo"),
                    )),
              ],
            ),
          );
        });
  }
}
