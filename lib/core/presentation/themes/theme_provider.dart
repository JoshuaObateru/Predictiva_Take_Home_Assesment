import 'package:flutter/material.dart';
import 'package:predictiva_take_home_assesment/core/presentation/themes/dark_mode.dart';
import 'package:predictiva_take_home_assesment/core/presentation/themes/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = darkMode;

  ThemeData get themeData => _themeData;

  bool get isLightMode => _themeData == lightMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
  }
}
