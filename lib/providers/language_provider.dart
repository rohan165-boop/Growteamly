import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier{
  Locale currentLocale = Locale("en");

  changeLocale() {
    if(currentLocale == Locale("en")) {
      currentLocale = Locale("ne");
    }else {
      currentLocale = Locale("en");
    }
    notifyListeners();
  }
}