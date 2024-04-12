import 'package:test_app/src/core/bpi/domain/models/bpi.dart';

abstract class BpiRepo {
  Future<Bpi> getCurrentBpiInUsd();
}
