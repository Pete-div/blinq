import 'package:bliqtest/_lib.dart';




class AppBaseThemeValues {
  static Color get dottedColor => const Color(0xFFCCCCCC);

  static final lightTheme = BaseTheme(
    isDark: false,
    textColors: ColorStyle(
      //bodyText
      c100: const Color(0xFF121212),
      //inactive
      c200: Color.fromARGB((255 / 2).ceil(), 18, 18, 18),
      //helptext
      c300: const Color.fromARGB(255, 46, 46, 46),
      //black
      c700: const Color(0xFF121212),
    ),
    iconColors: ColorStyle(c100: AppColors.black),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    white: Colors.white,
    primary: ColorStyle(
      c100: const Color.fromRGBO(227, 207, 255, 1),
      c400: const Color.fromRGBO(161, 96, 255, 1),
      c600: const Color.fromRGBO(114, 16, 255, 1),
    ),
    secondary: ColorStyle(
      c100: const Color.fromRGBO(242, 207, 224, 1),
      c200: const Color.fromRGBO(233, 175, 203, 1),
      c300: const Color.fromRGBO(222, 134, 176, 1),
      c400: const Color.fromRGBO(211, 94, 150, 1),
    ),
    success: ColorStyle(),
    warning: ColorStyle(),
    danger: ColorStyle(
      c400: const Color.fromRGBO(202, 84, 106, 1),
      c600: const Color.fromRGBO(176, 0, 32, 1),
    ),
    shadowColor: const Color.fromRGBO(217, 217, 217, 0.25),
    neutral: ColorStyle(
      c100: const Color.fromRGBO(255, 204, 204, 204),
      c200: const Color(0xFFCCCCCC),
      c300: const Color.fromRGBO(134, 134, 134, 1),
      c400: const Color.fromRGBO(94, 94, 94, 1),
      c500: const Color.fromRGBO(54, 54, 54, 1),
      c600: const Color.fromRGBO(14, 14, 14, 1),
    ),
    primaryColor: const Color(0xFF0C382E),
  );


  static final darkTheme = BaseTheme(
    isDark: true,
    textColors: ColorStyle(
      //bodyText
      c100: const Color.fromARGB(255, 255, 248, 248),
      //inactive
      c200: const Color.fromARGB(255, 205, 202, 202),
      //helptext
      c300: const Color(0xFF616161),
      //black
      c700: Colors.white,
    ),
    iconColors: ColorStyle(c100: AppColors.white),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.black,
    white: Colors.black,
    primary: ColorStyle(),
    secondary: ColorStyle(),
    success: ColorStyle(),
    warning: ColorStyle(),
    danger: ColorStyle(),
    neutral: ColorStyle(
      c100: const Color.fromRGBO(255, 204, 204, 204),
      c1000: const Color(0xFF616161),
      c200: const Color(0xFF383838),
      c600: Colors.white,
    ),
    shadowColor: Colors.grey,
    primaryColor: const Color.fromARGB(255, 39, 160, 132),
  );
}

class BaseTheme {
  final ColorStyle primary;
  final ColorStyle secondary;
  final ColorStyle success;
  final ColorStyle warning;
  final ColorStyle danger;
  final ColorStyle neutral;
  final Color primaryColor;
  final Color white;
  final Color shadowColor;
  final Color scaffoldBackgroundColor;
  final Brightness brightness;
  final ColorStyle iconColors;
  final ColorStyle textColors;
  final bool isDark;

  BaseTheme({
    required this.isDark,
    required this.primary,
    required this.secondary,
    required this.success,
    required this.warning,
    required this.neutral,
    required this.danger,
    required this.primaryColor,
    required this.white,
    required this.shadowColor,
    required this.scaffoldBackgroundColor,
    required this.brightness,
    required this.iconColors,
    required this.textColors,
  });
}

class ColorStyle {
  final Color? c100;
  final Color? c200;
  final Color? c300;
  final Color? c400;
  final Color? c500;
  final Color? c600;
  final Color? c700;
  final Color? c800;
  final Color? c900;
  final Color? c1000;

  ColorStyle(
      {this.c100,
      this.c200,
      this.c300,
      this.c400,
      this.c500,
      this.c600,
      this.c700,
      this.c800,
      this.c900,
      this.c1000});
}

