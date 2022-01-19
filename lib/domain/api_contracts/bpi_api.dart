import 'package:test_app/domain/models/bpi.dart';

abstract class BpiApi {
  Future<Bpi> getCurrentBpiInUsd();
}
