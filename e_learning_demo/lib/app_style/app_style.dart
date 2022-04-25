import 'package:flutter/material.dart';
class AppStyle {
  AppStyle._();

  static const double borderRadius = 12;

  static const BoxShadow boxShadow = BoxShadow(
    color: Colors.black12,
    blurRadius: 2,
    offset: Offset(0,1)
  );

  static double getBorderRadius(BuildContext context){
    return borderRadius * getScaleFactor(context);
  }

  static double getAppBarRadius(BuildContext context){
    return 42 * getScaleFactor(context);
  }
  static double getScaleFactor(BuildContext context){
    return MediaQuery.of(context).orientation == Orientation.portrait
        ?  MediaQuery.of(context).size.width/(360) > 1.5
        ? 1.5 : MediaQuery.of(context).size.width/(360)
        : MediaQuery.of(context).size.height/(360) > 1.5
        ? 1.5 : MediaQuery.of(context).size.height/(360);
  }

  static BorderRadius getCardBorder(BuildContext context){
    return BorderRadius.only(
      topRight: Radius.circular(
          AppStyle.borderRadius * AppStyle.getScaleFactor(context)
      ),
      topLeft: Radius.circular(
          AppStyle.borderRadius * AppStyle.getScaleFactor(context)
      ),
      bottomRight: Radius.circular(
          AppStyle.borderRadius * AppStyle.getScaleFactor(context)
      ),
    );
  }

  static BorderRadius getBorder2Sides(BuildContext context,double radius){
    return BorderRadius.only(
      topRight: Radius.circular(
          radius * AppStyle.getScaleFactor(context)
      ),
      bottomLeft: Radius.circular(
          radius * AppStyle.getScaleFactor(context)
      ),
    );
  }
}