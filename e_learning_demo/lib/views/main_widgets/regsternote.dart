import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterNote extends StatelessWidget {
  final double size;
  final Color color;
  final String text1;
  final String text2;
  final Function function;
  final FontWeight fontWeight;
  //to create two texts as one component
  RegisterNote(
      {this.size = 18,
      this.color = Colors.teal,
      this.fontWeight = FontWeight.bold,
      required this.function,
      required this.text1,
      required this.text2});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: text1,
              style: TextStyle(
                  color: Colors.black, fontSize: size, fontWeight: fontWeight)),
          TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  function();
                  print("Clicked");
                },
              text: "\t" + text2,
              style: TextStyle(
                color: color,
                fontSize: size,
              ))
        ]));
  }
}
