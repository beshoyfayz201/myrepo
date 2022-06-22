import 'package:e_learning_demo/app_style/colors.dart';
import 'package:e_learning_demo/app_style/size_config.dart';
import 'package:flutter/material.dart';

class MeassageBuble extends StatelessWidget {
  String name;
  String txt;
  bool isMe;
  Key key;
  MeassageBuble(this.name, this.isMe, this.txt, this.key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          isMe ? SizeConfig.width! * 0.4 : SizeConfig.defaultsize!,
          SizeConfig.defaultsize!,
          !isMe ? SizeConfig.width! * 0.4 : SizeConfig.defaultsize!,
          SizeConfig.defaultsize!),
      padding: EdgeInsets.all(SizeConfig.defaultsize!),
      decoration: BoxDecoration(
          border: (name == "z") //markup professur buble
              ? Border.all(color: Colors.white, width: 3)
              : null,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: isMe ? Radius.circular(15) : Radius.circular(0),
            bottomRight: !isMe ? Radius.circular(15) : Radius.circular(0),
          ),
          gradient: isMe
              ? LinearGradient(colors: [
                  AColors.prime,
                  AColors.prime.withOpacity(0.8),
                ])
              : LinearGradient(colors: [
                  AColors.lightGreen,
                  AColors.lightGreen.withOpacity(0.9)
                ])),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        children: [
          Text(
            name,
            textAlign: !isMe ? TextAlign.start : TextAlign.end,
            style: TextStyle(
              color: isMe ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            txt,
            style: TextStyle(
              color: isMe ? Colors.black : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
