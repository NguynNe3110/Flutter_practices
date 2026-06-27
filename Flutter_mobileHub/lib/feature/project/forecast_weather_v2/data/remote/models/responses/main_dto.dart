// lib/data/remote/models/responses/common/main_dto.dart
import 'package:flutter_mobilehub/feature/project/forecast_weather_v2/domain/entities/main_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_dto.freezed.dart';
part 'main_dto.g.dart';

@freezed
class MainDto with _$MainDto {
  const factory MainDto({
    @JsonKey(name: 'temp') required double temp,
    @JsonKey(name: 'feels_like') required double feelsLike,
    @JsonKey(name: 'temp_min') required double tempMin,
    @JsonKey(name: 'temp_max') required double tempMax,
    @JsonKey(name: 'pressure') required int pressure,
    @JsonKey(name: 'humidity') required int humidity,
    // @JsonKey(name: 'sea_level') int? seaLevel,      // Optional
    // @JsonKey(name: 'grnd_level') int? grndLevel,    // Optional
  }) = _MainDto;

  factory MainDto.fromJson(Map<String, dynamic> json) => _$MainDtoFromJson(json);

  // thêm hàm map sang table để lưu local
}