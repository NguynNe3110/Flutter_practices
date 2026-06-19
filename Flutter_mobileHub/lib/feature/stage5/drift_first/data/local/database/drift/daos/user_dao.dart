import 'package:drift/drift.dart';

import '../tables/users_entity.dart';
part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  //contructor
  UserDao(AppDatabase db) : super(db);

  Future<int> insertUser(UsersEntity user) {

  }
}