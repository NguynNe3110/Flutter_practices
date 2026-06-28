
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wind_entity.freezed.dart';
// part 'wind_entity.g.dart';

// class WindEntity {
//   final double speed;
//   final int deg;
//   final double? gust; // Giữ optional vì DTO là double?
//
//   const WindEntity({
//     required this.speed,
//     required this.deg,
//     this.gust,
//   });
// }


@freezed
class WindEntity with _$WindEntity {
  const factory WindEntity({
    required double speed,
    required int deg,
    double? gust, // Bỏ 'required' vì là nullable
  }) = _WindEntity;
}