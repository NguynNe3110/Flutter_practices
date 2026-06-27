// lib/data/remote/models/responses/current_weather_response.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'responses/main_dto.dart';
import 'responses/weather_dto.dart';
import 'responses/wind_dto.dart';
import 'responses/clouds_dto.dart';

part 'current_weather_response.freezed.dart';
part 'current_weather_response.g.dart';

@freezed
class CurrentWeatherResponse with _$CurrentWeatherResponse {
  const factory CurrentWeatherResponse({
    @JsonKey(name: 'weather') required List<WeatherDto> weather,
    @JsonKey(name: 'main') required MainDto main,
    @JsonKey(name: 'visibility') required int visibility,
    @JsonKey(name: 'wind') required WindDto wind,
    @JsonKey(name: 'clouds') required CloudsDto clouds,
    @JsonKey(name: 'dt') required int dt,
    @JsonKey(name: 'sys') required SysDto sys,
    @JsonKey(name: 'name') required String name,
    // @JsonKey(name: 'coord') required CoordDto coord, // not use
    // @JsonKey(name: 'base') required String base,
    // @JsonKey(name: 'timezone') required int timezone,
    // @JsonKey(name: 'id') required int id,
    // @JsonKey(name: 'cod') required int cod,
  }) = _CurrentWeatherResponse;

  factory CurrentWeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherResponseFromJson(json);
}

// Nested DTOs (chỉ dùng cho Current Weather)
// @freezed
// class CoordDto with _$CoordDto {
//   const factory CoordDto({
//     @JsonKey(name: 'lon') required double lon,
//     @JsonKey(name: 'lat') required double lat,
//   }) = _CoordDto;
//
//   factory CoordDto.fromJson(Map<String, dynamic> json) => _$CoordDtoFromJson(json);
// }

@freezed
class SysDto with _$SysDto {
  const factory SysDto({
    @JsonKey(name: 'country') required String country,
    @JsonKey(name: 'sunrise') required int sunrise,
    @JsonKey(name: 'sunset') required int sunset,
  }) = _SysDto;

  factory SysDto.fromJson(Map<String, dynamic> json) => _$SysDtoFromJson(json);
}