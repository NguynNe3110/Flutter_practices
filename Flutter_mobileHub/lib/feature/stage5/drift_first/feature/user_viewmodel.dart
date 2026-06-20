import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/local/datasources/user_local_datasource.dart';
import '../domain/entities/user_domain.dart';
import '../domain/repositories/user_repository.dart';

//để dùng riverpod di thì phải import file huong dan
import '../core/di/database_providers.dart';

part 'user_viewmodel.g.dart';

// 1. Provider cho Repository (để inject vào ViewModel)
// @riverpod
// UserRepository userRepository(UserRepositoryRef ref) {
//   // Ref sẽ được inject tự động từ DI container
//   throw UnimplementedError('Phải được override bởi DI');
// }

// 2. ViewModel sử dụng AsyncNotifier (cho stream reactive)
@riverpod
class UserViewModel extends _$UserViewModel {
  @override
  Stream<List<UserDomain>> build() {
    // Giờ nó sẽ tự động lấy được Repository thật từ DI
    final repository = ref.watch(userRepositoryProvider);
    return repository.observerUsers();
  }

  Future<void> addUser(String fullName, int? age) async {
    final repository = ref.read(userRepositoryProvider);
    final user = UserDomain(fullName: fullName, age: age);
    await repository.cacheUser(user);
  }

  Future<void> deleteUser(int userId) async {
    // TODO: Implement trong repository
  }
}

// 3. Provider cho LocalDataSource (để inject)
// @riverpod
// UserLocalDataSource userLocalDataSource(UserLocalDataSourceRef ref) {
//   throw UnimplementedError('Phải được override bởi DI');
// }