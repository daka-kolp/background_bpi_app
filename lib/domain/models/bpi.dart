import 'package:equatable/equatable.dart';

class Bpi extends Equatable {
  final String code;
  final double rate;

  const Bpi(this.code, this.rate);

  factory Bpi.fromJson(Map<String, dynamic> json) {
    return Bpi(json['code'] ?? '', json['rate_float'] ?? 0.0);
  }

  String get formattedRate {
    return rate.toStringAsFixed(2);
  }

  @override
  List<Object?> get props => [code, rate];
}