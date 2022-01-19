import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:test_app/device/store_interactor.dart';
import 'package:test_app/domain/api_contracts/bpi_api.dart';
import 'package:test_app/domain/models/bpi.dart';
import 'package:test_app/domain/models/range.dart';

class HomeCubit extends Cubit<Bpi?> {
  final StoreInteractor _storeInteractor;
  final BpiApi _api;

  HomeCubit()
      : _storeInteractor = GetIt.I<StoreInteractor>(),
        _api = GetIt.I<BpiApi>(),
        super(null) {
    _checkCurrentBpi();
    Timer.periodic(const Duration(minutes: 10), (timer) => _checkCurrentBpi());
  }

  Future<void> _checkCurrentBpi() async {
    final value = await _api.getCurrentBpiInUsd();
    emit(value);
  }

  Future<void> saveRange(Range range) async {
    await _storeInteractor.setRange(range);
  }

  Future<Range?> getRange() async {
    return await _storeInteractor.getRange();
  }
}
