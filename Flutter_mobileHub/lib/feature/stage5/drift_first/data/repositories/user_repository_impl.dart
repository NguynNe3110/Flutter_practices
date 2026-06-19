import 'package:flutter_mobilehub/feature/stage5/drift_first/domain/repositories/user_repository.dart';

import '../../domain/entities/user.dart';
import '../local/database/drift/daos/user_dao.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDao _userDao;
  UserRepositoryImpl(this._userDao);

  @override
  Future<void> cacheUser(User user) async {
    return;
  }

  @override
  Stream<List<User>> observerUsers() {

  }
}