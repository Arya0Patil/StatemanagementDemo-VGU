import 'package:flutter/material.dart';

class counterProvider extends ChangeNotifier {
  int counter = 0;
  addCount() {
    counter++;
    notifyListeners();
  }
}
