

import 'package:freezed_annotation/freezed_annotation.dart';

part 'clouds_entity.freezed.dart';
// part 'clouds_entity.g.dart';


// class CloudsEntity {
//   final int all; // Độ mây (0-100%)
//
//   const CloudsEntity({
//     required this.all,
//   });
// }

@freezed
class CloudsEntity with _$CloudsEntity {
  const factory CloudsEntity({
    required int all, // Độ mây (0-100%)
  }) = _CloudsEntity;
}