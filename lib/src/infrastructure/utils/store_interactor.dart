import 'dart:convert';
import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_android/shared_preferences_android.dart';
import 'package:shared_preferences_ios/shared_preferences_ios.dart';

const _range = 'range';

@singleton
class StoreInteractor {
  final SharedPreferences _prefs;

  StoreInteractor(this._prefs) {
    if (Platform.isAndroid) SharedPreferencesAndroid.registerWith();
    if (Platform.isIOS) SharedPreferencesIOS.registerWith();
  }

  Map<String, dynamic>? getRange() {
    final rangeJson = _prefs.getString(_range);
    return rangeJson != null ? jsonDecode(rangeJson) : null;
  }

  Future<void> setRange(Map<String, dynamic> range) async {
    await _prefs.setString(_range, jsonEncode(range));
  }
}
