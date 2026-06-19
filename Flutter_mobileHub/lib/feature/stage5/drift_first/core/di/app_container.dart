import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../data/local/database/drift/app_database.dart';
import '../../data/local/database/drift/daos/user_dao.dart';

// Hàm tạo instance của AppDatabase
AppDatabase createDatabase() {
  return AppDatabase(_openConnection());
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

// Đăng ký vào GetIt (Tương đương @Provides trong Hilt Module)
final getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton<AppDatabase>(() => createDatabase());
  getIt.registerLazySingleton<UserDao>(() => UserDao(getIt<AppDatabase>()));
}