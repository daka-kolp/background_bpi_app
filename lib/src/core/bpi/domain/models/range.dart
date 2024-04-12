import 'package:equatable/equatable.dart';

class Range extends Equatable {
  final double min;
  final double max;

  const Range(this.min, this.max);

  @override
  List<Object?> get props => [min, max];
}
