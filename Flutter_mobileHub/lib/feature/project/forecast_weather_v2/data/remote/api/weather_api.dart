import 'package:dio/dio.dart';
import 'package:flutter_mobilehub/feature/project/forecast_weather_v2/data/remote/models/current_weather_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../models/forecast_weather_response.dart';
part 'weather_api.g.dart';

@RestApi()
abstract class WeatherApi {
  factory WeatherApi(Dio dio, {String? baseUrl}) = _WeatherApi;

  @GET("weather")
  Future<CurrentWeatherResponse> getCurrentWeather(
      @Query("q") String city,
  );

  @GET("forecast")
  Future<ForecastWeatherResponse> getForecastWeather(
      @Query("q") String city,
  );
}
