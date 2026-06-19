// lib/feature/stage5/drift_first/data/local/datasources/user_local_datasource.dart
import '../database/drift/daos/user_dao.dart';
import '../database/drift/tables/users.dart';

abstract class UserLocalDataSource {
  Future<void> cacheUser(UsersCompanion user);
  Stream<List<User>> observeUsers();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final UserDao _userDao;

  UserLocalDataSourceImpl(this._userDao);

  @override
  Future<void> cacheUser(UsersCompanion user) async {
    await _userDao.into(_userDao.users).insert(user);
  }

  @override
  Stream<List<User>> observeUsers() {
    return _userDao.watchAllUsers();
  }
}