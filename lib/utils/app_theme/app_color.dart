import 'package:flutter/material.dart';

abstract class AppColors {
  // static Color get brandBlue => const Color(0xFF1823A5);
  static Color get green => const Color(0xFF076938);
  static Color get blue => const Color(0xFFC6FBE0);
  static Color get pink => const Color(0xFFF6BCB6);
  static Color get black => const Color(0xFF121212);
 static  Color get  darkGrey => const Color(0xFF3D3D3D);
  static   Color  get  darkGrey02 =>const Color(0xFF1A1A1A);
  static Color get red => const Color(0xffCD0000);
  static Color get primaryColor=> const Color(0xFF0A424A);
  static Color get secondaryColor=> const Color(0xffBDF2F9);
   static Color get primaryColorText=> const Color(0xFF00626F);
  static Color get white => const Color(0xFFFAFAFA);
  static Color get lightWhite => const Color(0xffF9FAFB);
  static Color get lightBle => const Color(0xffF9F9F9);
  static Color get grey => const Color(0xff475367);
  static Color get lightGrey=> const Color(0xff98A2B3);
  static Color get textGrey  => const Color(0xff667185);
  static Color get yellow => const Color(0xFF1823A5);
  static Color get buttonBgDark => const Color(0xFFEFF0FF);
  static Color get statusBarColor => const Color(0xFF4D56C0);
  

  // static Color get primaryColor => const Color(0xFF0C382E);
  static Color get cF1F1F1 => const Color(0xFFF1F1F1);
  static Color get cBDBDBD => const Color(0xFFBDBDBD);

  static Color canvas(BuildContext context) => ThemedColor(
        light: _LightTheme.canvas,
        dark: DarkTheme.canvas,
      ).getColor(context);

  static Color paidSatus(BuildContext context) => _LightTheme.paidStatus;

  static Color pendingStatus(BuildContext context) => _LightTheme.pendingStatus;

  static Color rejectedStatus(BuildContext context) =>
      _LightTheme.rejectedStatus;

  static Color acceptedStatus(BuildContext context) =>
      _LightTheme.acceptedStatus;
}

class ThemedColor {
  final Color light;
  final Color dark;

  const ThemedColor({
    required this.light,
    required this.dark,
  });

  Color getColor(BuildContext context) {
    switch (Theme.of(context).brightness) {
      case Brightness.light:
        return light;
      case Brightness.dark:
        return dark;
    }
  }
}

class _LightTheme {
  static Color get canvas => const Color(0xFFFEFEFE);

  static Color get paidStatus => const Color(0xFF00F872);
  static Color get pendingStatus => const Color(0xFFE7B418);
  static Color get rejectedStatus => const Color(0xFFCD0000);
  static Color get acceptedStatus => const Color(0xFFB7F800);
}

class DarkTheme {
  static Color get canvas => const Color(0xFF121212);
  static Color get paidStatus => const Color(0xFF00F872);
  static Color get pendingStatus => const Color(0xFFE7B418);
  static Color get rejectedStatus => const Color(0xFFCD0000);
  static Color get acceptedStatus => const Color(0xFFB7F800);
}
