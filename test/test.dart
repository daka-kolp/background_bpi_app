import 'package:flutter_test/flutter_test.dart';
import 'package:test_app/data/api/coindesk_api.dart';

void main() {
  final api = CoindeskApi();

  test('getCurrentBpiUsd', () async {
    final value = await api.getCurrentBpiInUsd();
    print(value.formattedRate);
  });
}