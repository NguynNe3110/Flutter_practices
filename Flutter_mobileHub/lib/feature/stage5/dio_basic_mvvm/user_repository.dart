
import 'user_domain.dart';

abstract class UserRepository {
  Future<List<UserDomain>> getUsers();
}