import 'package:ecommers/controller/cart_controller.dart';
import 'package:ecommers/core/class/handlingdataview.dart';
import 'package:ecommers/core/constant/color.dart';
import 'package:ecommers/data/model/cartmodel.dart';
import 'package:ecommers/view/widget/cart/buttoncheckout.dart';
import 'package:ecommers/view/widget/cart/cartcard.dart';
import 'package:ecommers/view/widget/cart/customsubtotal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/cart/couponcode.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartControllerImp>(
        init: CartControllerImp(),
        builder: (controller) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColor.wightpurble,
                title: Text(
                  "73".tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      height: 0.0,
                      color: AppColor.black),
                  textAlign: TextAlign.center,
                ),
                centerTitle: true,
              ),
              body: SingleChildScrollView(
                child: SizedBox(
                  width: Get.width,
                  height: Get.height / 1.04,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      GetBuilder<CartControllerImp>(
                          init: CartControllerImp(),
                          builder: (controller) {
                            return SizedBox(
                                height: Get.height / 2.3,
                                width: Get.width,
                                child: HandlingDataView(
                                    statusrequest: controller.statusRequest,
                                    widget: ListView.builder(
                                        physics: const ScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: controller.data.length,
                                        itemBuilder: (context, i) {
                                          return CustomCartCard(
                                            cartModel: CartModel.fromJson(
                                                controller.data[i]),
                                            index: i,
                                          );
                                        })));
                          }),
                      Container(
                        margin: const EdgeInsets.only(right: 10, left: 10),
                        child: Column(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomCoupon(
                              onPressedApply: () {
                                controller.checkCoupon();
                              },
                              controllercoupon: controller.controllercoupon,
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                             CustomSubTotalPrice(
                                subTotalPrice: double.parse(controller.getsubTotalPrice().toString()).toStringAsFixed(2), discount: controller.discount, shipping: controller.shipping,),
                            CustomButtonCheckOut(
                                numberOfItems: controller.totalitemscount,
                                totalPrice:double.parse(controller.priceOfCart.toString()).toStringAsFixed(2)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
