import 'dart:async';
import 'package:ecommers/core/class/statusrequest.dart';
import 'package:ecommers/core/services/services.dart';
import 'package:ecommers/data/datasource/remote/addaddress_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/constant/color.dart';
import '../../core/function/handlingdata.dart';

abstract class AddAddressController extends GetxController {}

class AddAddressControllerImp extends AddAddressController {
  //add detiles controller
  String? lat;
  String? long;
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.put(MyServices());
  GlobalKey<FormState> key = GlobalKey<FormState>();
  addAddress() async {
    if (key.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var res = await addressData.addAddresss(
          myServices.sharedPreferences.getInt("id").toString(),
          lat!,
          long!,
          name!.text,
          city!.text,
          street!.text);
      statusRequest = handlingData(res);
      if (StatusRequest.success == statusRequest) {
        if (res["status"] == "success") {
          Get.rawSnackbar(
              messageText: Text(
                "87".tr,
                style: const TextStyle(color: AppColor.wightpurble),
              ),
              duration: const Duration(milliseconds: 800));
          Get.back();
          update();
        }
      }
    }
    update();
  }

  //google map controller
  StatusRequest statusRequest = StatusRequest.loading;
  Completer<GoogleMapController>? completerController;

  Position? position;
  CameraPosition? kGooglePlex;

  List<Marker> markers = [];

  addMarker(LatLng latlan) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"), position: latlan));
    lat = latlan.latitude.toString();
    long = latlan.longitude.toString();
    update();
  }

  getCurrentPosition() async {
    position = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      zoom: 14.4746,
    );
    LatLng latlan = LatLng(position!.latitude, position!.longitude);
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"), position: latlan));
    lat = latlan.latitude.toString();
    long = latlan.longitude.toString();
    update();
    statusRequest = StatusRequest.success;
    update();
  }

  GoogleMapController? mapController;
  updataController(GoogleMapController controller) {
    mapController = controller;
    update();
  }

  @override
  void onInit() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    getCurrentPosition();
    completerController = Completer<GoogleMapController>();
    super.onInit();
  }
}
