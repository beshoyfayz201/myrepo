import 'package:e_learning_demo/app_style/colors.dart';
import 'package:e_learning_demo/models/algorithm.dart';
import 'package:e_learning_demo/views/screens/algorithm/alg_main_screen.dart';
import 'package:flutter/material.dart';

class SubCategory extends StatelessWidget {
  Color color;
  String img;
  String txt;
  Function goTo;
  SubCategory(
      {required this.color,
      required this.img,
      required this.txt,
      required this.goTo});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        goTo();
      },
      child: Card(
        elevation: 2,
        color: Colors.grey.shade200,
        shape: RoundedRectangleBorder(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          fit: StackFit.passthrough,
          children: [
            Image.asset(
              img,
              fit: BoxFit.contain,
            ),
            Positioned(
                bottom: 10,
                child: Text(
                  txt,
                  style: TextStyle(fontSize: 22, color: Colors.grey.shade700),
                )),
            SizedBox(
              height: 5,
              child: Container(
                color: color,
                height: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}
