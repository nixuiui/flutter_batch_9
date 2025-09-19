import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeLocalStorage {

  final SharedPreferences _prefs;
  ThemeLocalStorage(this._prefs);

  Future<void> setThemeMode(ThemeMode themeMode) async {
    await _prefs.setString('theme_mode', themeMode.toString());
  }

  ThemeMode getThemeMode() {
    final themeModeString = _prefs.getString('theme_mode');
    if (themeModeString == null) {
      return ThemeMode.system; // Default to system theme
    }
    switch (themeModeString) {
      case 'ThemeMode.light':
        return ThemeMode.light;
      case 'ThemeMode.dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system; // Fallback to system theme
    }
  }

}