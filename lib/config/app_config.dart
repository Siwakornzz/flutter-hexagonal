import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static const bool isDebug = true; // true = Debug, false = Production

  static String get apiBaseUrl {
    return isDebug
        ? "http://localhost:8080/api"
        : "https://api.yourapp.com/api";
  }

  static const int requestTimeout = 30; // ตั้งค่า Timeout ของ API (วินาที)

  static bool get useMockApi =>
      dotenv.get('USE_MOCK_API', fallback: 'false') == 'true';
}
