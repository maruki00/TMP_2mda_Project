import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  Widget? child;
  changechild() {
    notifyListeners();
  }
}
