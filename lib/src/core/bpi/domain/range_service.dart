import 'package:injectable/injectable.dart';

import 'package:test_app/src/core/bpi/domain/models/range.dart';
import 'package:test_app/src/core/bpi/domain/range_repo.dart';

@singleton
class RangeService {
  final RangeRepo _repo;

  const RangeService(this._repo);

  Future<Range?> getRange() => _repo.getRange();

  Future<void> setRange(Range range) => _repo.setRange(range);
}
