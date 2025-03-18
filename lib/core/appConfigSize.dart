import 'package:flutter/material.dart'
    show BuildContext, MediaQuery, MediaQueryData, Orientation;

class AppConfigSize {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }

}

double getHeight(double height) {
  double screenHeight = AppConfigSize.screenHeight;
  return (height / 812.0) * screenHeight;
}

double getWidth(double width) {
  double screenWidth = AppConfigSize.screenWidth;
  return (width / 375.0) * screenWidth;
}

double getSize(double px) {
  var height = getHeight(px);
  var width = getWidth(px);
  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}


