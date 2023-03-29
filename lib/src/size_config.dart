import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHieght;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHieght = _mediaQueryData!.size.height;

    blockSizeHorizontal = screenWidth! / 100;
    blockSizeVertical = screenHieght! / 100;
  }
}