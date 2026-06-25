import 'user_domain.dart';

class UserDto {
  final int id;
  final String name;
  final String email;

  UserDto({
    required this.id,
    required this.name,
    required this.email
  });

  // what is it
  // hàm này là hàm parse trong gson khi map json -> dto, ở đây mình pahri viết thủ công
  factory UserDto.fromJson(Map<String, dynamic> json ) {
    return UserDto(
      id: json['id'],
      name: json['name'],
      email: json['email']
    );
  }

  // ham mapper
  UserDomain toDomain() {
    return UserDomain(
      id: id,
      name: name,
      email: email
    );
  }
}