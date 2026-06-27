// lib/data/remote/models/responses/common/clouds_dto.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'clouds_dto.freezed.dart';
part 'clouds_dto.g.dart';

@freezed
class CloudsDto with _$CloudsDto {
  const factory CloudsDto({
    @JsonKey(name: 'all') required int all, // do may
  }) = _CloudsDto;

  factory CloudsDto.fromJson(Map<String, dynamic> json) => _$CloudsDtoFromJson(json);
}