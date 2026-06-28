import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_condition_entity.freezed.dart';
// part 'weather_condition_entity.g.dart';

// class WeatherConditionEntity {
//   final int id;
//   final String conditionName; // Map từ WeatherDto.main ("Clouds", "Rain")
//   final String description;
//   final String iconCode;      // Map từ WeatherDto.icon ("04d")
//
//   const WeatherConditionEntity({
//     required this.id,
//     required this.conditionName,
//     required this.description,
//     required this.iconCode,
//   });
// }


@freezed
class WeatherConditionEntity with _$WeatherConditionEntity {
  const factory WeatherConditionEntity({
    required int id,
    required String conditionName,
    required String description,
    required String iconCode,
  }) = _WeatherConditionEntity;
}