import 'package:flutter_mobilehub/feature/stage5/dio_first/user_domain.dart';

// Map sang Kotlin: interface UserRepository
abstract class UserRepository {
  Future<List<UserDomain>> getUsers();
}