import 'package:flutter/foundation.dart';

class Barang1 with ChangeNotifier {
  int _quantity1 = 0;

  int get quantity1 => _quantity1;
  set quantity1(int value) {
    _quantity1 = value;
    notifyListeners();
  }
}
