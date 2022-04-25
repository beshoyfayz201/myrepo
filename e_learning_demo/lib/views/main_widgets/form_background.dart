import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FormBackground extends StatelessWidget {
  final String imagePath;
  final String title;
  final Widget child;
  List<Color> graidentColor;
  FormBackground(
      {Key? key,
      required this.imagePath,
      required this.child,
      this.graidentColor = const [Colors.red, Color(0xFFF9A825)],
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: _size.height / 3.80,
          width: _size.width,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              graidentColor[0].withOpacity(0.7),
              graidentColor[1].withOpacity(0.7)
            ])),
          ),
          decoration: BoxDecoration(
            
            image: DecorationImage(

                image: AssetImage(
                  imagePath,

                ),
                fit: BoxFit.fill),
          ),
        ),
        SizedBox(
            height: _size.height / 3.80,
            child: Center(
                child: Text(
              title,
              style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 45,
                  ),
            ))),
        Container(
          margin: EdgeInsets.only(
            top: _size.height / 4.5,
          ),
          decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                topLeft: Radius.circular(32),
              )),
          child: child,
        )
      ],
    );
  }
}
