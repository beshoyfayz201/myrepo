import 'package:e_learning_demo/app_style/colors.dart';
import 'package:flutter/material.dart';

class TitleBlueY8 extends StatelessWidget {
  final String txt;
  final double size;
  const TitleBlueY8({Key? key, required this.txt, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(txt,
        style: TextStyle(
          fontFamily: "y",
          fontSize: size,
          color: AColors.prime,
          fontWeight: FontWeight.w600,
        ));
  }
}

class TitleBluedY8 extends StatelessWidget {
  final String txt;
  final double size;
  const TitleBluedY8({Key? key, required this.txt, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(txt,
        style: TextStyle(
          fontFamily: "y",
          fontSize: size,
          color: AColors.prime,
          fontWeight: FontWeight.w900,
        ));
  }
}
