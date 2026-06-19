import 'package:flutter_mobilehub/feature/stage5/drift_first/domain/entities/user_domain.dart';

abstract class UserRepository {
  Future<void> cacheUser(UserDomain user);

  Stream<List<UserDomain>> observerUsers();
}