import 'package:equatable/equatable.dart';

class Bpi extends Equatable {
  final String code;
  final double rate;

  const Bpi(this.code, this.rate);

  String get formattedRate => rate.toStringAsFixed(2);

  @override
  List<Object?> get props => [code, rate];
}