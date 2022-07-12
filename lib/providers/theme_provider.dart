import 'package:classapp/app/themes/dark_theme.dart';
import 'package:classapp/app/themes/light_theme.dart';
import 'package:classapp/constants/app_constants.dart';
import 'package:classapp/injector.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    getTheme();
  }
  ThemeData currentTheme = lightTheme;

  changeTheme() {
    if (currentTheme == lightTheme) {
      currentTheme = darkTheme;
    } else {
      currentTheme = lightTheme;
    }
    saveTheme(currentTheme);
    notifyListeners();
  }
  saveTheme(ThemeData currentTheme) {
    locator<SharedPreferences>().setBool(
      AppConstants.isDarkTheme, 
      currentTheme == darkTheme); 
  }

  getTheme() {
    bool? isDarkTheme = locator<SharedPreferences>().getBool(AppConstants.isDarkTheme);
    if(isDarkTheme != null && isDarkTheme == true) {
      currentTheme = darkTheme;
    } else {
      currentTheme = lightTheme;
    }
  }
}