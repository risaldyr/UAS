import 'package:flutter/foundation.dart';

class Barang3 with ChangeNotifier {
  int _quantity3 = 0;

  int get quantity3 => _quantity3;
  set quantity3(int value) {
    _quantity3 = value;
    notifyListeners();
  }
}
