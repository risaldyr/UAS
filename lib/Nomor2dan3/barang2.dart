import 'package:flutter/foundation.dart';

class Barang2 with ChangeNotifier {
  int _quantity2 = 0;

  int get quantity2 => _quantity2;
  set quantity2(int value) {
    _quantity2 = value;
    notifyListeners();
  }
}
