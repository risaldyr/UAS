import 'package:flutter/foundation.dart';

class Hasil with ChangeNotifier {
  int _total = 0;

  int get total => _total;
  set total(int value) {
    _total = value;
    notifyListeners();
  }
}
