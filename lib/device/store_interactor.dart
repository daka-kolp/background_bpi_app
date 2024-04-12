import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/domain/models/range.dart';

const _range = 'range';

class StoreInteractor {
  Future<Range?> getRange() async {
    final prefs = await SharedPreferences.getInstance();
    final rangeJson = prefs.getString(_range);
    if(rangeJson != null) {
      return Range.fromJson(jsonDecode(rangeJson));
    }
    return null;
  }

  Future<void> setRange(Range range) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_range, jsonEncode(range.toJson()));
  }
}

