import 'package:ecommers/controller/items_controller.dart';
import 'package:ecommers/controller/search_controller.dart';
import 'package:ecommers/core/class/handlingdataview.dart';
import 'package:ecommers/view/widget/appbar.dart';
import 'package:ecommers/view/widget/items/list_categories_items.dart';
import 'package:ecommers/view/widget/items/list_items.dart';
import 'package:ecommers/view/widget/search/searchitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Itemspage extends StatelessWidget {
  const Itemspage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    return GetBuilder<SearchControllerImp>(
        init: SearchControllerImp(),
        builder: (controllerImp) {
          return Scaffold(
              body: Padding(
                  padding: const EdgeInsets.all(9),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      CustomAppBar(
                        title: "58".tr,
                        onPressedNotification: () {},
                        onPressedSearch: () {
                          controllerImp
                              .onSearchitems(controllerImp.search!.text);
                          controllerImp.getItems(controllerImp.search!.text);
                        },
                        onPressedFavorite: () {
                          controller.goToFavoritePage();
                        },
                        onChanged: (val) {
                          controllerImp.isChanged(val);
                          controllerImp
                              .onSearchitems(controllerImp.search!.text);
                          controllerImp.getItems(controllerImp.search!.text);
                        },
                        mycontroller: controllerImp.search,
                      ),
                      !controllerImp.isSearch
                          ? const Column(
                              children: [
                                CustomListCategoriesItems(),
                                CustomListItems()
                              ],
                            )
                          : HandlingDataView(
                              statusrequest: controllerImp.statusRequest,
                              widget: const CustomListItemsSearch())
                    ],
                  )));
        });
  }
}
