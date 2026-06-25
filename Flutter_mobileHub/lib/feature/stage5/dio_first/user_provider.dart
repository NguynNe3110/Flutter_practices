import 'package:flutter_mobilehub/feature/stage5/dio_first/user_remote_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'get_users_usecase.dart';
import 'user_repository_impl.dart';
import 'user_repository.dart';
import 'app_provider.dart';
// 👇 IMPORT TỪ TẦNG CORE

// 1. Định nghĩa Provider (Map sang @HiltViewModel + ViewModelFactory)
// Đây là nơi Riverpod biết cách tạo ra UseCase -> Repo -> DataSource -> Dio

// 2. DataSource (Dùng lại Dio từ Core - Map sang việc @Inject Dio vào Constructor)
final userRemoteDataSourceProvider = Provider((ref) {
  final dio = ref.watch(dioProvider); // 👈 LẤY DIO TỪ CORE
  return UserRemoteDataSource(dio);
});

// 3. Repository
final userRepositoryProvider = Provider<UserRepository>((ref) {
  final dataSource = ref.watch(userRemoteDataSourceProvider);
  return UserRepositoryImpl(dataSource);
});

// 4. UseCase
final getUsersUseCaseProvider = Provider((ref) {
  final repo = ref.watch(userRepositoryProvider);
  return GetUsersUseCase(repo);
});