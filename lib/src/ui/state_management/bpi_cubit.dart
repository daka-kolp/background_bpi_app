import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:test_app/src/core/bpi/domain/bpi_service.dart';
import 'package:test_app/src/core/bpi/domain/models/bpi.dart';

@injectable
class BpiCubit extends Cubit<Bpi?> {
  final BpiService _bpiService;

  BpiCubit(this._bpiService) : super(null) {
    _checkCurrentBpi();
    Timer.periodic(const Duration(minutes: 10), (timer) => _checkCurrentBpi());
  }

  Future<void> _checkCurrentBpi() async {
    try {
      final value = await _bpiService.getCurrentBpiInUsd();
      emit(value);
    } catch (e) {
      debugPrint('BpiCubit error: $e');
    }
  }
}
