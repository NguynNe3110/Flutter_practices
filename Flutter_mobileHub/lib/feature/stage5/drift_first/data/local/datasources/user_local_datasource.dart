import '../database/drift/app_database.dart';
import '../database/drift/daos/user_dao.dart';


class UserLocalDataSource {
  final UserDao _userDao;
  UserLocalDataSource(this._userDao);

  // insert
  @override
  Future<void> InsertUser(UsersCompanion user) async {
    await _userDao.insertUser(user);
  }

  @override
  Stream<List<User>> observeUsers() {
    return _userDao.watchAllUsers();
  }
}