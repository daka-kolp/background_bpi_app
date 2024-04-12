import 'package:test_app/src/core/bpi/domain/models/range.dart';

abstract class RangeRepo {
  Future<Range?> getRange();

  Future<void> setRange(Range range);
}
