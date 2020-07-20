import 'package:flutter/foundation.dart';

class Uang with ChangeNotifier {
  int _money = 1000000;

  int get money => _money;
  set money(int value) {
    _money = value;
    notifyListeners();
  }
}
