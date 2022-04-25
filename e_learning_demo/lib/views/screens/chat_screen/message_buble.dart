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
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: isMe ? Radius.circular(15) : Radius.circular(0),
            bottomRight: !isMe ? Radius.circular(15) : Radius.circular(0),
          ),
          gradient: isMe
              ? LinearGradient(colors: [
                  Colors.blue.shade200,
                  Colors.blue.shade500,
                ])
              : LinearGradient(
                  colors: [Colors.grey.shade700, Colors.grey.shade600])),
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
