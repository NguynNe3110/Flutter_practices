import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_domain.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  // 1. Dòng này BẮT BUỘC nếu bạn muốn viết hàm toDomain() bên dưới
  const UserDto._();

  // 2. Khai báo các field (Dùng @JsonKey nếu tên Dart khác tên JSON)
  const factory UserDto({
    @JsonKey(name: 'id', defaultValue: 0) required int id, // id đầu là của json trả về, ta map sang dto là id thứ 2
    required String name, // Tên trùng JSON nên không cần @JsonKey
    required String email,
  }) = _UserDto;

  // 3. Hàm từ JSON sang DTO (Bắt buộc phải có)
  factory UserDto.fromJson(Map<String, dynamic> json) => _$UserDtoFromJson(json);

  // 4. Hàm từ DTO sang Domain (Logic của tầng Data)
  UserDomain toDomain() {
    return UserDomain(
      id: id,
      name: name,
      email: email,
    );
  }
}

// class UserDto {
//   final int id;
//   final String name;
//   final String email;
//
//   UserDto({required this.id, required this.name, required this.email});
//
//   // Map sang Kotlin: companion object { fun fromJson(json: JSONObject) }
//   factory UserDto.fromJson(Map<String, dynamic> json) {
//     return UserDto(
//       id: json['id'] as int,
//       name: json['name'] as String,
//       email: json['email'] as String,
//     );
//   }
//
//   // Map sang Kotlin: fun toEntity(): UserEntity
//   UserDomain toDomain() {
//     return UserDomain(
//         id: id,
//         name: name,
//         email: email);
//   }
// }
