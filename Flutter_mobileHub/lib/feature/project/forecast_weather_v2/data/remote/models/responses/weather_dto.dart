// lib/data/remote/models/responses/common/weather_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_dto.freezed.dart';
part 'weather_dto.g.dart';

@freezed
class WeatherDto with _$WeatherDto {
  const factory WeatherDto({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'main') required String main,           // "Clouds", "Rain"
    @JsonKey(name: 'description') required String description, // "mây đen u ám"
    @JsonKey(name: 'icon') required String icon,           // "04d"
  }) = _WeatherDto;

  factory WeatherDto.fromJson(Map<String, dynamic> json) => _$WeatherDtoFromJson(json);
}