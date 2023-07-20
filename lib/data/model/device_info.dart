import 'package:flutter/material.dart';

import '../../core/class/device_type.dart';

class DeviceInformation {
  final Orientation orientation;
  final DeviceType deviceType;
  final double screenHieght;
  final double screenWidth;
  final double localWidth;
  final double localHieght;

  DeviceInformation(
      {required this.orientation,
      required this.deviceType,
      required this.screenHieght,
      required this.screenWidth,
      required this.localWidth,
      required this.localHieght});
}
