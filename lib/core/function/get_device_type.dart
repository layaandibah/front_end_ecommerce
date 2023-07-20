import 'package:flutter/material.dart';

import '../class/device_type.dart';

DeviceType getDeviseType(MediaQueryData mediaQueryData) {
  Orientation orientation = mediaQueryData.orientation;
  double width = 0.0;
  if (orientation == Orientation.landscape) {
    width = mediaQueryData.size.height;
  } else {
    width = mediaQueryData.size.width;
  }
  if (width >= 600) {
    return DeviceType.Tablet;
  }
  if (width >= 950) {
    return DeviceType.Desktop;
  }
  return DeviceType.Mobile;
}

