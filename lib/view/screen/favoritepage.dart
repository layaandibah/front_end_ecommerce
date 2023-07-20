import 'package:ecommers/controller/search_controller.dart';
import 'package:ecommers/core/class/handlingdataview.dart';
import 'package:ecommers/data/model/favorite_model.dart';
import 'package:ecommers/view/widget/appbar.dart';
import 'package:ecommers/view/widget/myfavorite/custommyfavorite.dart';
import 'package:ecommers/view/widget/search/searchitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/myfavorite_controller.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyFavoriteController controller = Get.put(MyFavoriteController());
    return Scaffold(
        body: GetBuilder<SearchControllerImp>(
      init: SearchControllerImp(),
      builder: (controllerImp) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              children: [
                CustomAppBar(
                  title: "58".tr,
                  onPressedNotification: () {},
                  onPressedSearch: () {
                    controllerImp.onSearchitems(controllerImp.search!.text);
                    controllerImp.getItems(controllerImp.search!.text);
                  },
                  onPressedFavorite: () {
                    controllerImp.goToFavoritePage();
                  },
                  onChanged: (val) {
                    controllerImp.isChanged(val);
                    controllerImp.onSearchitems(controllerImp.search!.text);
                    controllerImp.getItems(controllerImp.search!.text);
                  },
                  mycontroller: controllerImp.search,
                ),
                !controllerImp.isSearch
                    ? GetBuilder<MyFavoriteController>(builder: (controller) {
                        return SizedBox(
                          height: Get.height,
                          child: ListView.builder(
                              physics: const ScrollPhysics(),
                              itemCount: controller.data.length,
                              itemBuilder: (context, i) {
                                return CustomMyFavorite(
                                    itemsModel: MyFavoriteModel.fromJson(
                                        controller.data[i]));
                              }),
                        );
                      })
                    : HandlingDataView(
                        statusrequest: controllerImp.statusRequest,
                        widget: const CustomListItemsSearch(),
                      ),
              ]),
        );
      },
    ));
  }
}
