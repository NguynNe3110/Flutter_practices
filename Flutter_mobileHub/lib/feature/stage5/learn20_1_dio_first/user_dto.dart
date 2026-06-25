import 'user_domain.dart';

class UserDto {
  final int id;
  final String name;
  final String email;

  UserDto({required this.id, required this.name, required this.email});

  // Map sang Kotlin: companion object { fun fromJson(json: JSONObject) }
  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
    );
  }

  // Map sang Kotlin: fun toEntity(): UserEntity
  UserDomain toDomain() {
    return UserDomain(
        id: id,
        name: name,
        email: email);
  }
}