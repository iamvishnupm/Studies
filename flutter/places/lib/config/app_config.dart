// config.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static final mapTilerKey = dotenv.env['MAPTILER_API_KEY'] ?? '';
}
