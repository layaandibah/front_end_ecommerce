import 'package:ecommers/applinks.dart';
import 'package:ecommers/controller/productdetiles_controller.dart';
import 'package:ecommers/core/class/handlingdataview.dart';
import 'package:ecommers/core/constant/color.dart';
import 'package:ecommers/core/constant/imageasset.dart';
import 'package:ecommers/core/function/translate_database.dart';
import 'package:ecommers/view/widget/items_detiles/customitem_button.dart';
import 'package:ecommers/view/widget/items_detiles/customitem_desc.dart';
import 'package:ecommers/view/widget/items_detiles/customitem_image.dart';
import 'package:ecommers/view/widget/items_detiles/customitem_name.dart';
import 'package:ecommers/view/widget/items_detiles/customiteme_pricerating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/items_detiles/customclipper.dart';
import '../widget/items_detiles/customitem_color.dart';
import '../widget/items_detiles/customitem_counter.dart';

class ProductDetiles extends StatelessWidget {
  const ProductDetiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.wightpurble,
        body: GetBuilder<ProductDetilesControllerImp>(
          init: ProductDetilesControllerImp(),
          builder: (controller) {
            return HandlingDataView(
                statusrequest: controller.statusRequest,
                widget: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 460,
                          child: Stack(
                            children: [
                              ClipPath(
                                  clipper: CustomClipPathUp(),
                                  child: Container(
                                    width: double.infinity,
                                    height: 400,
                                    color: AppColor.primarycolor,
                                  )),
                              Positioned(
                                  top: 40,
                                  left: Get.width / 3,
                                  child: CustomItemName(
                                    name:
                                        "${translatDatabase(controller.item["items_name_ar"], controller.item["items_name"])}",
                                  )),
                              Positioned(
                                  top: 200,
                                  right: 80,
                                  child: CustomItemImage(
                                    itemid: "${controller.item["items_id"]}",
                                    imageUrl:
                                        "${AppLinks.itemsImages}/${controller.item["items_image"]}",
                                  )),
                              if (controller.itemsdiscount > 0)
                                Positioned(
                                  top: 160,
                                  right: 80,
                                  child: SizedBox(
                                      width: 90,
                                      height: 90,
                                      // decoration: BoxDecoration(
                                      //     color: AppColor.green,
                                      //     borderRadius: BorderRadius.circular(100)),
                                      child: Image.asset(
                                          ImageAsset.itemdetilesoffers)
                                      // Center(
                                      //     child: Text(
                                      //       "82".tr,
                                      //       style:const TextStyle(
                                      //           fontSize: 15, color: AppColor.wightpurble, height: 0),
                                      //       textAlign: TextAlign.center,
                                      //     )),
                                      ),
                                ),
                              const Positioned(
                                  top: 250,
                                  right: 20,
                                  child: CustomItemColor()),
                              if (controller.itemsdiscount > 0)
                                Positioned(
                                  bottom: 10,
                                  left: 30,
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: AppColor.redAccent,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                        child: Text(
                                      "${controller.itemsdiscount}%",
                                      style: const TextStyle(
                                          fontSize: 20,
                                          color: AppColor.wightpurble,
                                          height: 0),
                                      textAlign: TextAlign.center,
                                    )),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        CustomItemPriceRating(
                            newprice: controller.newprice,
                            discount: controller.itemsdiscount,
                            price: controller.price),
                        CustomItemDesc(
                            descreption:
                                "${translatDatabase(controller.item["items_desc_ar"], controller.item["items_desc"])}"),
                        GetBuilder<ProductDetilesControllerImp>(
                            init: ProductDetilesControllerImp(),
                            builder: (controller) {
                              return CustomItemCounter(
                                counter: "${controller.itemscount}",
                                onTapAdd: () {
                                  controller
                                      .add("${controller.item["items_id"]}");
                                },
                                onTapRemove: () {
                                  controller
                                      .delete("${controller.item["items_id"]}");
                                },
                              );
                            }),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomItemButton(
                          onPressedAddToCart: () {
                            controller.goToCart();
                            controller
                                .getItems("${controller.item["items_id"]}");
                          },
                          onPressedGoToCart: () {},
                        )
                      ],
                    )));
          },
        ));
  }
}
//
