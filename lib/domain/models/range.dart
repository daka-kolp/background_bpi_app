import 'package:equatable/equatable.dart';

class Range extends Equatable {
  final double min;
  final double max;

  const Range(this.min, this.max);

  factory Range.fromJson(Map<String, dynamic> json) {
    return Range(json['min'] as double? ?? 0.0, json['max'] as double? ?? 0.0);
  }

  Map<String, dynamic> toJson() {
    return {'min': min, 'max': max};
  }

  @override
  List<Object?> get props => [min, max];
}
