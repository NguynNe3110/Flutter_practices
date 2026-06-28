import 'main_entity.dart';
import 'weather_condition_entity.dart';
import 'wind_entity.dart';
import 'clouds_entity.dart';
import 'sys_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_weather_entity.freezed.dart';
// part 'current_weather_entity.g.dart';

// class CurrentWeatherEntity {
//   final String cityName;
//   final List<WeatherConditionEntity> conditions;
//   final MainEntity main;
//   final int visibility;
//   final WindEntity wind;
//   final CloudsEntity clouds;
//   final int dt;               // timestamp
//   final SysEntity sys;
//
//   // dùng để Repository kiểm tra cache
//   // final DateTime lastUpdated;
//
//   const CurrentWeatherEntity({
//     required this.cityName,
//     required this.conditions,
//     required this.main,
//     required this.visibility,
//     required this.wind,
//     required this.clouds,
//     required this.dt,
//     required this.sys,
//     // required this.lastUpdated,
//   });
// }



@freezed
class CurrentWeatherEntity with _$CurrentWeatherEntity {
  const factory CurrentWeatherEntity({
    required String cityName,
    required List<WeatherConditionEntity> conditions,
    required MainEntity main,
    required int visibility,
    required WindEntity wind,
    required CloudsEntity clouds,
    required int dt, // timestamp
    required SysEntity sys,
  }) = _CurrentWeatherEntity;
}