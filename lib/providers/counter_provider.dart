import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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