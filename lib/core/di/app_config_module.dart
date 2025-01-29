import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppConfig {
  final String googleClientId;
  final String baseUrl;
  final String redisHost;
  final num redisPort;
  final String redisUser;
  final String redisPassword;

  AppConfig({
    required this.baseUrl,
    required this.googleClientId,
    required this.redisHost,
    required this.redisPort,
    required this.redisUser,
    required this.redisPassword,
  });

  @factoryMethod
  factory AppConfig.fromEnv() {
    return AppConfig(
      baseUrl: dotenv.env['BASE_URL'] ?? '',
      redisHost: dotenv.env['REDIS_HOST'] ?? 'localhost',
      redisPort: int.parse(dotenv.env['REDIS_PORT'] ?? '6379'),
      redisUser: dotenv.env['REDIS_USER'] ?? '',
      redisPassword: dotenv.env['REDIS_PASSWORD'] ?? '',
      googleClientId: dotenv.env['GOOGLE_CLIENT_ID'] ?? '',
    );
  }
}
