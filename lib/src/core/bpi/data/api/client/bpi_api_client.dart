import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import 'package:test_app/src/core/bpi/data/api/dto/bpi_in_usd_dto.dart';
import 'package:test_app/src/infrastructure/network/api_endpoints.dart';

part 'bpi_api_client.g.dart';

@singleton
@RestApi()
abstract class BpiApiClient {
  @factoryMethod
  factory BpiApiClient(Dio dio) = _BpiApiClient;

  @GET(ApiEndpoints.currentPriceBpiInUsd)
  Future<BpiInUsdWrapperDto> getCurrentBpiInUsd();
}
