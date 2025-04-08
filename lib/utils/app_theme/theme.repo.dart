
import 'package:flutter/material.dart';
import'package:bliqtest/utils/pref_data.dart' as pref;

ThemeRepo themeRepo = ThemeRepo();

class ThemeRepo {
  Future<bool> setThemeMode({required ThemeMode mode}) async {
    var value = 0;
    switch (mode) {
      case ThemeMode.system:
        value = 0;

        break;
      case ThemeMode.light:
        value = 1;

        break;
      case ThemeMode.dark:
        value = 2;

        break;
    }
    final result = await pref.save(
      key: 'appTheme',
      value: value.toString(),
    );
    return result;
  }

  Future<ThemeMode> getTheme() async {
    var result = await pref.getValue(
      key: 'appTheme',
    );
    switch (result.toString()) {
      case '0':
        return ThemeMode.system;

      case '1':
        return ThemeMode.light;

      case '2':
        return ThemeMode.dark;
    }
    return ThemeMode.light;
  }
}
