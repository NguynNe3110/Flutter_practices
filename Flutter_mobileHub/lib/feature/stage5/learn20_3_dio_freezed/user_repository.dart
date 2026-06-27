import 'user_domain.dart';

// Map sang Kotlin: interface UserRepository
abstract class UserRepository {
  Future<List<UserDomain>> getUsers();
}