import 'package:injectable/injectable.dart';

import 'package:test_app/src/core/bpi/data/api/client/bpi_api_client.dart';
import 'package:test_app/src/core/bpi/data/api/mapper/bpi_mapper.dart';
import 'package:test_app/src/core/bpi/domain/bpi_repo.dart';
import 'package:test_app/src/core/bpi/domain/models/bpi.dart';

@Singleton(as: BpiRepo)
class HttpBpiRepo extends BpiRepo {
  final BpiApiClient _apiClient;
  final BpiMapper _bpiMapper;

  HttpBpiRepo(this._apiClient, this._bpiMapper);

  @override
  Future<Bpi> getCurrentBpiInUsd() async {
    final result = await _apiClient.getCurrentBpiInUsd();
    return _bpiMapper.fromBpiInUsdDto(result);
  }
}
