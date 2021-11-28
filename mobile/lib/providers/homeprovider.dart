import 'package:flutter/material.dart';
import 'package:sn/services/userstorage.dart';
import 'package:sn/ui/pages/app/feedpage.dart';

class HomeProvider extends ChangeNotifier {
  Widget _child = FeedsPage();
  Widget get child => _child;
  void set child(child) => _child = child;
  changechild() {
    notifyListeners();
  }

  updatechild(Widget child) {
    _child = child;
    notifyListeners();
  }

  logout() async {
    await UserStorage.logout();
  }
}
