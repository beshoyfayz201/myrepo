import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Monitor extends ChangeNotifier {
  String actions = "";

  addEvent(String a) {
    actions += a;
    notifyListeners();
  }
}
