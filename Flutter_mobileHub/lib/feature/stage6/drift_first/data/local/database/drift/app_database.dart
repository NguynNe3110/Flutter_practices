import 'package:drift/drift.dart';
import 'package:flutter_mobilehub/feature/stage6/drift_first/data/local/database/drift/tables/users.dart';

import 'daos/user_dao.dart';

part 'app_database.g.dart';

// 1. Khai báo Database (Tương đương @Database(entities = [User::class], version = 1))
@DriftDatabase(tables: [Users], daos: [UserDao])
class AppDatabase extends _$AppDatabase {

  // Constructor: Truyền vào executor (nơi kết nối SQLite) và schema version
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  // --- MIGRATION (Tương đương Migration) ---
  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from == 1) {
            // Ví dụ: Thêm cột mới ở version 2
            // await m.addColumn(users, users.newColumn);
          }
        },
        beforeOpen: (details) async {
          // Bật foreign keys (Mặc định SQLite tắt, Room tự bật, Drift thì ta phải tự bật ở đây)
          await customStatement('PRAGMA foreign_keys = ON');
        }
    );
  }
}