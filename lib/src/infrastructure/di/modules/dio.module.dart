import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'package:test_app/src/infrastructure/config.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio getDio(AppConfig config) {
    return Dio(BaseOptions(baseUrl: config.baseUrl))..transformer = BackgroundTransformer();
  }
}
