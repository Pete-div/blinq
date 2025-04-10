// ignore_for_file: deprecated_member_use

import 'package:bliqtest/utils/app_theme/app_theme.dart';
import 'package:bliqtest/utils/app_theme/theme.repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appThemeModeProvider =
    StateNotifierProvider<AppThemeModeProvider, ThemeMode>(
  (ref) => AppThemeModeProvider(ref, ThemeMode.light),
);

final appThemeProvider = StateNotifierProvider<AppThemeDataProvider, BaseTheme>(
  (ref) => AppThemeDataProvider(ref: ref, state: AppBaseThemeValues.lightTheme),
);

class AppThemeDataProvider extends StateNotifier<BaseTheme>
    with WidgetsBindingObserver {
  final StateNotifierProviderRef ref;

  AppThemeDataProvider({required this.ref, required BaseTheme state})
      : super(state) {
    init();
  }

  init() {
    final mode = ref.watch(appThemeModeProvider);
    state = getTheme(mode);
    if (mode == ThemeMode.dark) {
      _updateStatusBar(AppBaseThemeValues.darkTheme);
    } else {
      _updateStatusBar(AppBaseThemeValues.lightTheme);
    }
  }

  void _updateStatusBar(BaseTheme theme) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: theme.scaffoldBackgroundColor, // Background color
        statusBarIconBrightness: theme.brightness == Brightness.dark
            ? Brightness.light // Light icons for dark mode
            : Brightness.dark, // Dark icons for light mode
      ),
    );
  }

  BaseTheme getTheme(ThemeMode mode) {
    switch (ref.read(appThemeModeProvider)) {
      case ThemeMode.light:
        return AppBaseThemeValues.lightTheme;
      case ThemeMode.dark:
        return AppBaseThemeValues.darkTheme;
      default:
        if (WidgetsBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.light) {
          return AppBaseThemeValues.lightTheme;
        } else {
          return AppBaseThemeValues.darkTheme;
        }
    }
  }

  Color get primaryColor => state.primaryColor;

  @override
  void didChangePlatformBrightness() {
    _updateThemeData();
    super.didChangePlatformBrightness();
  }

  _updateThemeData() {
    if (ref.read(appThemeModeProvider) == ThemeMode.system) {
      if (WidgetsBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.light) {
        state = AppBaseThemeValues.lightTheme;
      } else {
        state = AppBaseThemeValues.darkTheme;
      }
    }
  }
}

class AppThemeModeProvider extends StateNotifier<ThemeMode>
    with WidgetsBindingObserver {
  final StateNotifierProviderRef ref;
  AppThemeModeProvider(this.ref, ThemeMode state) : super(state) {
    _init();
  }

  _init() async {
    state = await themeRepo.getTheme();
  }

  update(ThemeMode newMode) {
    state = newMode;
    themeRepo.setThemeMode(mode: state);
  }

  @override
  void didChangePlatformBrightness() {
    updateThemeData();

    super.didChangePlatformBrightness();
  }

  updateThemeData() {
    if (state == ThemeMode.system) {
      if (WidgetsBinding.instance.platformDispatcher.platformBrightness ==
          Brightness.light) {
        state = ThemeMode.light;
      } else {
        state = ThemeMode.dark;
      }
    }
    ref.read(appThemeProvider.notifier).init();
  }
}
