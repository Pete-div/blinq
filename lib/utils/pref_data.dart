import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? _prefs;

Future<bool> initPref() async {
  _prefs = await SharedPreferences.getInstance();
  return true;
}

Future<bool> save({required String key, required String value}) async {
  if (_prefs == null) {
    await initPref();
  }
  if (value.isEmpty) {
    return await _prefs?.remove(key) ?? false;
  }
  log('SAVE $key== $value');
  return await _prefs?.setString(key, jsonEncode(value)) ?? false;
}

Future<bool> deleteKey({required String key}) async {
  if (_prefs == null) {
    await initPref();
  }
  log('DELETE $key');

  return await _prefs?.remove(key) ?? false;
}

Future<dynamic> getValue({required String key}) async {
  if (_prefs == null) {
    await initPref();
  }
  final value = _prefs?.getString(key) ?? "";
  log('READ $key == $value');
  return value.isEmpty ? null : jsonDecode(value);
}
