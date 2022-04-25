import 'package:flutter/material.dart';

class SizeConfig {
  static double? width;
  static double? height;
  static double? defaultsize;
  static Orientation? orientation;

  void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;
    defaultsize =
        orientation == Orientation.landscape ? height! * 0.024 : width! * 0.024;
    print("the default value is  :  $defaultsize");
  }
}
