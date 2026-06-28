
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_entity.freezed.dart';
// part 'main_entity.g.dart';

// class MainEntity {
//   final double temp;
//   final double feelsLike;
//   final double tempMin;
//   final double tempMax;
//   final int pressure;
//   final int humidity;
//
//   const MainEntity({
//     required this.temp,
//     required this.feelsLike,
//     required this.tempMin,
//     required this.tempMax,
//     required this.pressure,
//     required this.humidity,
//   });
// }


@freezed
class MainEntity with _$MainEntity {
  const factory MainEntity({
    required double temp,
    required double feelsLike,
    required double tempMin,
    required double tempMax,
    required int pressure,
    required int humidity,
  }) = _MainEntity;
}