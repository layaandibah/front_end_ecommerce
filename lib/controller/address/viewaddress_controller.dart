import 'package:ecommers/core/constant/routes.dart';
import 'package:ecommers/data/datasource/remote/addaddress_data.dart';
import 'package:get/get.dart';

import '../../core/class/statusrequest.dart';
import '../../core/function/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/model/address_model.dart';

abstract class ViewAddressController extends GetxController {}

class ViewAddressControllerImp extends ViewAddressController {
  MyServices myServices = Get.find();
  StatusRequest? statusRequest;
  AddressData addressData = AddressData(Get.find());
  List<AddressModel> address = [];
  String? addressid;
  getAllAddress() async {
    address.clear();
    update();
    statusRequest = StatusRequest.loading;
    var res = await addressData
        .viewAddresss("${myServices.sharedPreferences.getInt("id")}");
    statusRequest = handlingData(res);
    if (StatusRequest.success == statusRequest) {
      if (res["status"] == "success") {
        List data = res["data"];
        print(data);
        address.addAll(data.map((e) => AddressModel.fromJson(e)));
        print(address);
      } else {
        statusRequest = StatusRequest.nodata;
      }
    } else {
      statusRequest = StatusRequest.nodata;
    }
    update();
  }

  deleteAddress(String addressid) async {
    address.removeWhere((element) => element.addressId == addressid);
    await addressData.deleteAddresss(addressid);
    await getAllAddress();
    update();
  }

  goToEditAddress(AddressModel addressModel) {
    Get.delete<ViewAddressControllerImp>();
    Get.offNamed(AppRoutes.editAddress, arguments: {
      "address_id": addressModel.addressId,
      "address_lat": addressModel.addressLat,
      "address_long": addressModel.addressLong,
      "address_name": addressModel.addressName,
      "address_city": addressModel.addressCity,
      "address_street": addressModel.addressStreet
    });
  }

  @override
  void onInit() {
    getAllAddress();
    super.onInit();
  }
}
