import 'forecast_item_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forecast_weather_entity.freezed.dart';
// part 'forecast_weather_entity.g.dart';


// class ForecastWeatherEntity {
//   final String cod;
//   final int message;
//   final int cnt;
//   final List<ForecastItemEntity> list;
//
//   const ForecastWeatherEntity({
//     required this.cod,
//     required this.message,
//     required this.cnt,
//     required this.list,
//   });
// }



@freezed
class ForecastWeatherEntity with _$ForecastWeatherEntity {
  const factory ForecastWeatherEntity({
    required String cod,
    required int message,
    required int cnt,
    required List<ForecastItemEntity> list,
  }) = _ForecastWeatherEntity;
}