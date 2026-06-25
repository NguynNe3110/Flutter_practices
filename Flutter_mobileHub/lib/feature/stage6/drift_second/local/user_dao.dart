//
//
// import 'package:drift/drift.dart';
// import 'package:flutter_mobilehub/feature/stage5/drift_first/data/local/database/drift/app_database.dart';
//
// part 'user_dao.g.dart';
//
// @DriftAccessor(tables: [Users]);
// class UserDao extends DriftAccessor<AppDatabase>> with _$UserDaoMixin {
//   //contructor
//   UserDao(AppDatabase db) : super(db);
//
//   Stream<List<User>> watchAllUsers() => select(users).watch();
//
//   Future<int> addUser(String name, int age) {
//     return into(users).insert(
//       UsersCompanion.insert(name: name, age: age),
//     );
//   }
// }