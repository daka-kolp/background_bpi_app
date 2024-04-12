import 'package:injectable/injectable.dart';

import 'package:test_app/src/core/bpi/data/api/dto/range_dto.dart';
import 'package:test_app/src/core/bpi/domain/models/range.dart';

@singleton
class RangeMapper {
  Range fromDto(RangeDto dto) => Range(dto.min, dto.max);

  RangeDto toDto(Range model) => RangeDto(model.min, model.max);
}
