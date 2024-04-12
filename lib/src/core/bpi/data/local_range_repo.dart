import 'package:injectable/injectable.dart';

import 'package:test_app/src/core/bpi/data/api/dto/range_dto.dart';
import 'package:test_app/src/core/bpi/data/api/mapper/range_mapper.dart';
import 'package:test_app/src/core/bpi/domain/models/range.dart';
import 'package:test_app/src/core/bpi/domain/range_repo.dart';
import 'package:test_app/src/infrastructure/utils/store_interactor.dart';

@Singleton(as: RangeRepo)
class LocalRangeRepo extends RangeRepo {
  final StoreInteractor _storeInteractor;
  final RangeMapper _rangeMapper;

  LocalRangeRepo(this._storeInteractor,this._rangeMapper,);

  @override
  Future<Range?> getRange() async {
    final result = _storeInteractor.getRange();
    return result != null ? _rangeMapper.fromDto(RangeDto.fromJson(result)) : null;
  }

  @override
  Future<void> setRange(Range range) async {
    await _storeInteractor.setRange(_rangeMapper.toDto(range).toJson());
  }
}
