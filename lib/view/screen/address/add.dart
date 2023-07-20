import 'package:ecommers/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../controller/address/add_controller.dart';
import '../../widget/address/bodybuttonsheet.dart';
import '../../widget/address/bottongetcurrentlocation.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddAddressControllerImp controllerPage = Get.put(AddAddressControllerImp());
    return Scaffold(
        appBar: AppBar(title: const Text("Add New Address"), centerTitle: true),
        body: GetBuilder<AddAddressControllerImp>(
          builder: (controllerPage) {
            return Container(
                child: Column(
              children: [
                if (controllerPage.kGooglePlex != null)
                  Expanded(
                      child: HandlingDataView(
                          statusrequest: controllerPage.statusRequest,
                          widget: Stack(
                            alignment: Alignment.center,
                            children: [
                              GoogleMap(
                                onTap: (latlan) {
                                  controllerPage.addMarker(latlan);
                                },
                                mapType: MapType.normal,
                                markers: controllerPage.markers.toSet(),
                                initialCameraPosition:
                                    controllerPage.kGooglePlex!,
                                onMapCreated: (GoogleMapController controller) {
                                  controllerPage.completerController!
                                      .complete(controller);
                                  controllerPage.updataController(controller);
                                },
                              ),
                              Positioned(
                                bottom: Get.height / 8,
                                right: 12,
                                child: CustomBottonCurrentLocation(
                                    onPressed: () async {
                                  await controllerPage.getCurrentPosition();
                                  await controllerPage.mapController
                                      ?.animateCamera(CameraUpdate
                                          .newCameraPosition(CameraPosition(
                                              target: LatLng(
                                                  double.parse(
                                                      controllerPage.lat!),
                                                  double.parse(
                                                      controllerPage.long!)),
                                              zoom: 17)));
                                }),
                              ),
                              const Positioned(
                                  bottom: 10,
                                  child: CustomAddressDetilesButtomSheet()),
                            ],
                          )))
              ],
            ));
          },
        ));
  }
}
