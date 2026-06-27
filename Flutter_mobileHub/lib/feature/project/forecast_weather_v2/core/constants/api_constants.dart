import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static const String baseUrl = 'https://api.openweathermap.org/data/2.5/';
  static final String apiKey = dotenv.env['OPENWEATHER_API_KEY'] ?? "";
  static const String lang = 'vi';
  static const String units = 'metric';
}