
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sys_entity.freezed.dart';
// part 'sys_entity.g.dart';

// class SysEntity {
//   final String country;
//   final int sunrise; // Timestamp
//   final int sunset;  // Timestamp
//
//   const SysEntity({
//     required this.country,
//     required this.sunrise,
//     required this.sunset,
//   });
// }

@freezed
class SysEntity with _$SysEntity {
  const factory SysEntity({
    required String country,
    required int sunrise, // Timestamp
    required int sunset,  // Timestamp
  }) = _SysEntity;
}