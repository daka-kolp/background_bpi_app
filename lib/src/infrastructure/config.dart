import 'package:injectable/injectable.dart';

@singleton
class AppConfig {
  final String baseUrl;

  AppConfig() : baseUrl = _baseUrl;

  static const String _baseUrl = String.fromEnvironment(_baseUrlArgName, defaultValue: _localhost);
}

const _baseUrlArgName = 'BASE_URL';

const _localhost = 'https://api.coindesk.com/v1';
