// lib/data/remote/models/responses/forecast/forecast_weather_response.dart
import 'package:flutter_mobilehub/feature/project/forecast_weather_v2/data/remote/models/responses/forecast_item_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'responses/forecast_item_dto.dart';

part 'forecast_weather_response.freezed.dart';
part 'forecast_weather_response.g.dart';

@freezed
class ForecastWeatherResponse with _$ForecastWeatherResponse {
  const factory ForecastWeatherResponse({
    @JsonKey(name: 'cod') required String cod,
    @JsonKey(name: 'message') required int message,
    @JsonKey(name: 'cnt') required int cnt,
    @JsonKey(name: 'list') required List<ForecastItemDto> list,
  }) = _ForecastWeatherResponse;

  factory ForecastWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$ForecastWeatherResponseFromJson(json);
}

