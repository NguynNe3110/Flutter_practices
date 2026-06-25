import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Điều chỉnh lại đường dẫn import cho đúng với thư mục project của bạn
import '../../data/local/database/drift/app_database.dart';
import '../../data/local/database/drift/daos/user_dao.dart';
import '../../data/local/datasources/user_local_datasource.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/repositories/user_repository.dart';

part 'database_providers.g.dart';

// 1. AppDatabase (Singleton - keepAlive: true để không bị khởi tạo lại)
@Riverpod(keepAlive: true)
AppDatabase appDatabase(AppDatabaseRef ref) {
  return AppDatabase(_openConnection());
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

// 2. UserDao
@Riverpod(keepAlive: true)
UserDao userDao(UserDaoRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return UserDao(db);
}

// 3. LocalDataSource
@Riverpod(keepAlive: true)
UserLocalDataSource userLocalDataSource(UserLocalDataSourceRef ref) {
  final dao = ref.watch(userDaoProvider);
  return UserLocalDataSource(dao);
}

// 4. Repository (Cung cấp implementation thực tế cho Domain)
@Riverpod(keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  final localDataSource = ref.watch(userLocalDataSourceProvider);
  return UserRepositoryImpl(localDataSource);
}