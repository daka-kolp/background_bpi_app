import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_app/domain/api_contracts/bpi_api.dart';
import 'package:test_app/domain/models/bpi.dart';

class CoindeskApi extends BpiApi {
  final _client = Dio();
  final _baseLink ='https://api.coindesk.com/v1';

  @override
  Future<Bpi> getCurrentBpiInUsd() async {
    final response = await _client.get('$_baseLink/bpi/currentprice/USD.json');
    final json = jsonDecode(response.data);
    final bpiUsdJson = json['bpi']['USD'];
    return bpiUsdJson != null
        ? Bpi.fromJson(bpiUsdJson)
        : throw Exception('getCurrentBpiUsd: json is null');
  }
}
