import 'package:ecommers/core/function/get_device_type.dart';
import 'package:ecommers/data/model/device_info.dart';
import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({Key? key, required this.builder}) : super(key: key);
  final Widget Function(BuildContext context, DeviceInformation deviceInfo)
      builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrains) {
      var mediaQuery = MediaQuery.of(context);
      DeviceInformation deviceInfo = DeviceInformation(
          orientation: mediaQuery.orientation,
          deviceType: getDeviseType(mediaQuery),
          localHieght: constrains.maxHeight,
          localWidth: constrains.maxWidth,
          screenHieght: mediaQuery.size.height,
          screenWidth: mediaQuery.size.width);
      return builder(context, deviceInfo);
    });
  }
}
