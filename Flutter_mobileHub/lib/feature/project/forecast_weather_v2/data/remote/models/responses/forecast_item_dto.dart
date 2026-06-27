// lib/data/remote/models/responses/forecast/forecast_item_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'main_dto.dart';
import 'weather_dto.dart';
import 'wind_dto.dart';
import 'clouds_dto.dart';

part 'forecast_item_dto.freezed.dart';
part 'forecast_item_dto.g.dart';

@freezed
class ForecastItemDto with _$ForecastItemDto {
  const factory ForecastItemDto({
    @JsonKey(name: 'dt') required int dt,
    @JsonKey(name: 'main') required MainDto main,
    @JsonKey(name: 'weather') required List<WeatherDto> weather,
    @JsonKey(name: 'clouds') required CloudsDto clouds,
    @JsonKey(name: 'wind') required WindDto wind,
    @JsonKey(name: 'visibility') required int visibility,
    @JsonKey(name: 'pop') double? pop,              // tỉ lệ mưa (0-1)
    @JsonKey(name: 'rain') RainDto? rain,           // lượng mưa trong 3h
    @JsonKey(name: 'sys') required ForecastSysDto sys,
    // @JsonKey(name: 'dt_txt') required String dtTxt,
  }) = _ForecastItemDto;

  factory ForecastItemDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastItemDtoFromJson(json);
}

@freezed
class RainDto with _$RainDto {
  const factory RainDto({
    @JsonKey(name: '3h') double? h3,  // Lượng mưa trong 3h
  }) = _RainDto;

  factory RainDto.fromJson(Map<String, dynamic> json) => _$RainDtoFromJson(json);
}

@freezed
class ForecastSysDto with _$ForecastSysDto {
  const factory ForecastSysDto({
    @JsonKey(name: 'pod') required String pod, // "d" = day, "n" = night
  }) = _ForecastSysDto;

  factory ForecastSysDto.fromJson(Map<String, dynamic> json) =>
      _$ForecastSysDtoFromJson(json);
}