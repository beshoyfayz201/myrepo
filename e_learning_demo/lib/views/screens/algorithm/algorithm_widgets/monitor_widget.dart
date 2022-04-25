import 'package:e_learning_demo/control/monitor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TopMonitorWidget extends StatelessWidget {
  Widget child;
  String title;

  TopMonitorWidget({Key? key, required this.child, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String actions = Provider.of<Monitor>(context).actions;
    return WillPopScope(
      onWillPop: () async {
        actions = "$title" + actions;
        print(actions);
        Navigator.pop(context);
        return false;
      },
      child: child,
    );
  }
}
