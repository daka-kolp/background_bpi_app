import 'package:json_annotation/json_annotation.dart';

part 'range_dto.g.dart';

@JsonSerializable()
class RangeDto {
  @JsonKey(defaultValue: 0.0)
  final double min;
  @JsonKey(defaultValue: 0.0)
  final double max;

  const RangeDto(this.min, this.max);

  factory RangeDto.fromJson(Map<String, dynamic> json) => _$RangeDtoFromJson(json);

  Map<String, dynamic> toJson() => _$RangeDtoToJson(this);
}
