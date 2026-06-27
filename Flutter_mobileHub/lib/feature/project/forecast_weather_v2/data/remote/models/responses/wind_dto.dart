// lib/data/remote/models/responses/common/wind_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wind_dto.freezed.dart';
part 'wind_dto.g.dart';

@freezed
class WindDto with _$WindDto {
  const factory WindDto({
    @JsonKey(name: 'speed') required double speed,
    @JsonKey(name: 'deg') required int deg,
    @JsonKey(name: 'gust') double? gust,
  }) = _WindDto;

  factory WindDto.fromJson(Map<String, dynamic> json) => _$WindDtoFromJson(json);
}