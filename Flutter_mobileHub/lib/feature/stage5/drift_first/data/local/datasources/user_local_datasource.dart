import '../database/drift/app_database.dart';
import '../database/drift/daos/user_dao.dart';


class UserLocalDataSource {
  final UserDao _userDao;
  UserLocalDataSource(this._userDao);

  // insert
  Future<void> InsertUser(UsersCompanion user) async {
    await _userDao.insertUser(user);
  }

  Future<int> deleteById(int id) async {
    return await _userDao.deleteUserById(id);
  }

  Stream<List<User>> observeUsers() {
    return _userDao.watchAllUsers();
  }
}