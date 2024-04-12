import 'package:json_annotation/json_annotation.dart';

part 'bpi_dto.g.dart';

@JsonSerializable(createToJson: false)
class BpiTimeDto {
  @JsonKey(name: 'updatedISO')
  final DateTime updatedAt;

  const BpiTimeDto(this.updatedAt);

  factory BpiTimeDto.fromJson(Map<String, dynamic> json) => _$BpiTimeDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class BpiExchangeRateDto {
  final String code;
  final String rate;
  final String description;
  @JsonKey(name: 'rate_float')
  final double rateFloat;

  const BpiExchangeRateDto(this.code, this.rate, this.description, this.rateFloat);

  factory BpiExchangeRateDto.fromJson(Map<String, dynamic> json) => _$BpiExchangeRateDtoFromJson(json);
}
