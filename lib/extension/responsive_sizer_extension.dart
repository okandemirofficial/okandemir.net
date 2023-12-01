import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

extension DeviceBools on Device {
  static bool get isDesktopOrTablet =>
      Device.screenType == ScreenType.desktop || Device.screenType == ScreenType.tablet;
  static bool get isMobile => Device.screenType == ScreenType.mobile;
}

extension ResponsiveExt on BuildContext {
  bool get isDesktopOrTablet =>
      Device.screenType == ScreenType.desktop || Device.screenType == ScreenType.tablet;
  bool get isMobile => Device.screenType == ScreenType.mobile;

  // static bool isMobile() {
  //   return Device.screenType == ScreenType.mobile;
  // }
}
