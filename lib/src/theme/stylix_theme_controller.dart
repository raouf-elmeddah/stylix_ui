import 'package:flutter/material.dart';

import 'stylix_brand.dart';

class StylixThemeController extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  StylixBrand _brand = StylixBrand.defaultBrand;

  ThemeMode get themeMode => _themeMode;
  StylixBrand get brand => _brand;

  void setThemeMode(ThemeMode value) {
    if (_themeMode == value) return;
    _themeMode = value;
    notifyListeners();
  }

  void toggleThemeMode() {
    switch (_themeMode) {
      case ThemeMode.light:
        _themeMode = ThemeMode.dark;
        break;
      case ThemeMode.dark:
        _themeMode = ThemeMode.system;
        break;
      case ThemeMode.system:
        _themeMode = ThemeMode.light;
        break;
    }
    notifyListeners();
  }

  void setBrand(StylixBrand value) {
    if (_brand == value) return;
    _brand = value;
    notifyListeners();
  }
}
