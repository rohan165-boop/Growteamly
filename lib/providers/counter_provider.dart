import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier{
  int count = 10;
  increaseCounter () {
    count++;
    notifyListeners();
  }
  dereaseCounter () {
    count--;
    notifyListeners();
  }

}