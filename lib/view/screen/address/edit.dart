import 'package:ecommers/core/class/handlingdataview.dart';
import 'package:ecommers/view/widget/address/bottongetcurrentlocation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../controller/address/editaddress_controller.dart';
import '../../widget/address/bodybuttomsheetedit.dart';

class EditAddress extends StatelessWidget {
  const EditAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EditAddressControllerImp controllerPage =
        Get.put(EditAddressControllerImp());
    return Scaffold(
        appBar: AppBar(title: Text("86".tr), centerTitle: true),
        body: GetBuilder<EditAddressControllerImp>(
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
                                  },
                                ),
                              ),
                              const CustomButtomSheetEdit()
                            ],
                          )))
              ],
            ));
          },
        ));
  }
}
