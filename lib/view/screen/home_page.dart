import 'package:ecommers/controller/homepage_controller.dart';
import 'package:ecommers/controller/search_controller.dart';
import 'package:ecommers/core/class/handlingdataview.dart';
import 'package:ecommers/view/widget/appbar.dart';
import 'package:ecommers/view/widget/home/boxdiscount.dart';
import 'package:ecommers/view/widget/home/categoriescard.dart';
import 'package:ecommers/view/widget/home/itemshome.dart';
import 'package:ecommers/view/widget/home/titlepromotion.dart';
import 'package:ecommers/view/widget/search/searchitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    HomePageControllerImp controller = Get.put(HomePageControllerImp());
    return GetBuilder<SearchControllerImp>(
      init: SearchControllerImp(),
      builder: (controllerImp) {
        return HandlingDataView(
            statusrequest: controller.statusrequest,
            widget: Container(
              width: screenwidth,
              height: screenheight,
              padding: const EdgeInsets.all(9),
              child: ListView(
                children: [
                  CustomAppBar(
                    title: "58".tr,
                    onPressedNotification: () {},
                    onPressedSearch: () {
                      controllerImp.onSearchitems(controllerImp.search!.text);
                      controllerImp.getItems(controllerImp.search!.text);
                    },
                    onPressedFavorite: () {
                      controller.goToFavoritePage();
                    },
                    onChanged: (val) {
                      controllerImp.isChanged(val);
                      controllerImp.onSearchitems(controllerImp.search!.text);
                      controllerImp.getItems(controllerImp.search!.text);
                    },
                    mycontroller: controllerImp.search,
                  ),
                  !controllerImp.isSearch
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            const CustomBoxDiscount(
                                title: "A Summer Offers", body: "Discount 20%"),
                            CustomPromotionTitle(title: "61".tr),
                            const CustomCategoriesCard(),
                            CustomPromotionTitle(title: "60".tr),
                            const CustomItemsHome()
                          ],
                        )
                      : HandlingDataView(
                          statusrequest: controllerImp.statusRequest,
                          widget: const CustomListItemsSearch())
                ],
              ),
            ));
      },
    );
  }
}
