import 'package:flutter_mobilehub/feature/stage6/drift_first/domain/entities/user_domain.dart';

abstract class UserRepository {
  Future<void> cacheUser(UserDomain user);

  Future<int> deleteUserById(int id);

  Stream<List<UserDomain>> observerUsers();
}