import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/class/statusrequest.dart';
import '../../core/constant/color.dart';
import '../../core/constant/routes.dart';
import '../../core/function/handlingdata.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/addaddress_data.dart';

abstract class EditAddressController extends GetxController {}

class EditAddressControllerImp extends EditAddressController {
  String? lat;
  String? long;
  String? nameAddress;
  String? cityAddress;
  String? streetAddress;
  String? addressId;
  TextEditingController? name;
  TextEditingController? city;
  TextEditingController? street;
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.put(MyServices());
  GlobalKey<FormState> key = GlobalKey<FormState>();
  editAddress() async {
    if (key.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var res = await addressData.editAddresss(
          addressId!, lat!, long!, name!.text, city!.text, street!.text);
      statusRequest = handlingData(res);
      if (StatusRequest.success == statusRequest) {
        if (res["status"] == "success") {
          Get.rawSnackbar(
              messageText: Text(
                "88".tr,
                style: const TextStyle(color: AppColor.wightpurble),
              ),
              duration: const Duration(milliseconds: 800));
          Get.offNamed(AppRoutes.viewAddress);
          update();
        }
      }
    }
    update();
  }

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

  getPosition() async {
    kGooglePlex = CameraPosition(
      target: LatLng(double.parse(lat!), double.parse(long!)),
      zoom: 14.4746,
    );
    LatLng latlan = LatLng(double.parse(lat!), double.parse(long!));
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
    nameAddress = Get.arguments["address_name"];
    addressId = Get.arguments["address_id"].toString();
    cityAddress = Get.arguments["address_city"];
    streetAddress = Get.arguments["address_street"];
    lat = Get.arguments["address_lat"].toString();
    long = Get.arguments["address_long"].toString();
    street!.text = streetAddress!;
    name!.text = nameAddress!;
    city!.text = cityAddress!;
    getPosition();
    completerController = Completer<GoogleMapController>();
    super.onInit();
  }
}
