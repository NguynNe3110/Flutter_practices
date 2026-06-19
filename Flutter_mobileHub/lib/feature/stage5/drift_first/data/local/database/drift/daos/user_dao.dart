// lib/feature/stage5/drift_first/data/local/database/drift/daos/user_dao.dart
import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/users.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(AppDatabase db) : super(db);

  // Map sang Android: @Insert(onConflict = REPLACE)
  Future<int> insertUser(UsersCompanion user) {
    return into(users).insert(user);
  }

  // Map sang Android: @Query("SELECT * FROM users")
  Future<List<User>> getAllUsers() {
    return select(users).get();
  }

  // Map sang Android: Flow<List<User>> (Reactive)
  Stream<List<User>> watchAllUsers() {
    return select(users).watch();
  }
}