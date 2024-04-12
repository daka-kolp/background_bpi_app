import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:test_app/src/core/bpi/domain/models/range.dart';
import 'package:test_app/src/core/bpi/domain/range_service.dart';

@injectable
class RangeCubit extends Cubit<Range?> {
  final RangeService _rangeService;

  RangeCubit(this._rangeService) : super(null) {
    _getRange();
  }

  Future<void> _getRange() async {
    emit(await _rangeService.getRange());
  }

  Future<void> saveRange(Range range) async {
    await _rangeService.setRange(range);
    emit(range);
  }
}
