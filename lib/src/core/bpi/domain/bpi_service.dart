import 'package:injectable/injectable.dart';

import 'package:test_app/src/core/bpi/domain/bpi_repo.dart';
import 'package:test_app/src/core/bpi/domain/models/bpi.dart';

@singleton
class BpiService {
  final BpiRepo _repo;

  const BpiService(this._repo);

  Future<Bpi> getCurrentBpiInUsd() => _repo.getCurrentBpiInUsd();
}
