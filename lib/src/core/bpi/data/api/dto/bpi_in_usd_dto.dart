import 'package:json_annotation/json_annotation.dart';

import 'package:test_app/src/core/bpi/data/api/dto/bpi_dto.dart';

part 'bpi_in_usd_dto.g.dart';

@JsonSerializable(createToJson: false)
class BpiInUsdWrapperDto {
  final BpiTimeDto time;
  final String disclaimer;
  final BpiInUsdDto bpi;

  const BpiInUsdWrapperDto(this.time, this.disclaimer, this.bpi);

  factory BpiInUsdWrapperDto.fromJson(Map<String, dynamic> json) => _$BpiInUsdWrapperDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class BpiInUsdDto {
  @JsonKey(name: 'USD')
  final BpiExchangeRateDto usd;

  const BpiInUsdDto(this.usd);

  factory BpiInUsdDto.fromJson(Map<String, dynamic> json) => _$BpiInUsdDtoFromJson(json);
}
