import 'package:flutter/material.dart';

class LoginMeathods extends StatelessWidget {
  List<String> pathes = ["face", "google", "link"];
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            3,
            (index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Image.asset(
                    "assets/images/${pathes[index]}.png",
                    fit: BoxFit.fitWidth,
                    height: 50,
                    width: 50,
                  ),
                )));
  }
}
