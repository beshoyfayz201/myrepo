import 'package:flutter/material.dart';

class Loader with ChangeNotifier {
  bool isLoading = false;
  changeLoaderState() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
