import 'package:flutter_mobilehub/feature/stage5/dio_first/user_entity.dart';

// Map sang Kotlin: interface UserRepository
abstract class UserRepository {
  Future<List<UserEntity>> getUsers();
}