import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/domain/models/range.dart';

const _range = 'range';

class StoreInteractor {
  Future<Range?> getMinMaxValues() async {
    final prefs = await SharedPreferences.getInstance();
    final rangeJson = prefs.getString(_range);
    if(rangeJson != null) {
      return Range.fromJson(jsonDecode(rangeJson));
    }
  }

  Future<void> setMinMaxValues(Range range) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_range, jsonEncode(range.toJson()));
  }
}

