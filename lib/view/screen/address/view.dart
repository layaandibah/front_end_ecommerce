import 'package:ecommers/controller/address/viewaddress_controller.dart';
import 'package:ecommers/core/class/handlingdataview.dart';
import 'package:ecommers/core/constant/color.dart';
import 'package:ecommers/core/constant/routes.dart';
import 'package:ecommers/data/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAddress extends StatelessWidget {
  const ViewAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ViewAddressControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Address"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.delete<ViewAddressControllerImp>();
          Get.offNamed(AppRoutes.addAddress);
        },
        child: const Icon(Icons.add),
      ),
      body: GetBuilder<ViewAddressControllerImp>(
        init: ViewAddressControllerImp(),
        builder: (controller) {
          return HandlingDataView(
              statusrequest: controller.statusRequest,
              widget: Container(
                child: ListView.builder(
                  itemCount: controller.address.length,
                  itemBuilder: (context, i) {
                    return AddressCard(addressModel: controller.address[i]);
                  },
                ),
              ));
        },
      ),
    );
  }
}

class AddressCard extends StatelessWidget {
  final AddressModel addressModel;

  const AddressCard({Key? key, required this.addressModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ViewAddressControllerImp>(
        init: ViewAddressControllerImp(),
        builder: (controller) {
          return Card(
            child: ListTile(
              isThreeLine: true,
              minLeadingWidth: 30,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              leading: const Icon(
                Icons.location_on,
                color: AppColor.black,
              ),
              trailing: PopupMenuButton(
                  onSelected: (value) async {
                    if (value == MenuItem.delete) {
                      print("delete");
                      await controller
                          .deleteAddress(addressModel.addressId.toString());
                    }
                    if (value == MenuItem.edit) {
                      controller.goToEditAddress(addressModel);
                      print("edit");
                    }
                  },
                  itemBuilder: (context) => [
                        const PopupMenuItem<MenuItem>(
                            value: MenuItem.delete,
                            child: SizedBox(
                              width: 80,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Delete",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: AppColor.primarycolor),
                                  ),
                                  Icon(
                                    Icons.delete,
                                    color: AppColor.red,
                                    size: 18,
                                  ),
                                ],
                              ),
                            )),
                        PopupMenuItem<MenuItem>(
                          value: MenuItem.edit,
                          child: SizedBox(
                            width: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "85".tr,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: AppColor.primarycolor),
                                ),
                                const Icon(
                                  Icons.edit,
                                  color: AppColor.blue,
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ]),
              title: Text(
                addressModel.addressName!,
                style:
                    const TextStyle(color: AppColor.primarycolor, fontSize: 18),
              ),
              subtitle: Text(
                  "${addressModel.addressCity!} _ ${addressModel.addressStreet!}"),
            ),
          );
        });
  }
}

enum MenuItem { delete, edit }
