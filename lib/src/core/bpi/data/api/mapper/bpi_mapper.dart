import 'package:injectable/injectable.dart';

import 'package:test_app/src/core/bpi/data/api/dto/bpi_in_usd_dto.dart';
import 'package:test_app/src/core/bpi/domain/models/bpi.dart';

@singleton
class BpiMapper {
  Bpi fromBpiInUsdDto(BpiInUsdWrapperDto dto) {
    final bpiDtp = dto.bpi.usd;
    return Bpi(bpiDtp.code, bpiDtp.rateFloat);
  }
}
