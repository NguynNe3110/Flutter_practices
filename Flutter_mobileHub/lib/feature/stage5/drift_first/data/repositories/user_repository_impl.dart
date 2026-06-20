import 'package:flutter_mobilehub/feature/stage5/drift_first/domain/repositories/user_repository.dart';
import '../../domain/entities/user_domain.dart';
import '../local/datasources/user_local_datasource.dart';
import '../mapper/user_mapper.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource _localDataSource;

  // ✅ Constructor chuẩn, không bị lỗi cú pháp
  UserRepositoryImpl(this._localDataSource);

  @override
  Future<void> cacheUser(UserDomain user) async {
    await _localDataSource.InsertUser(user.toCompanion());
  }

  @override
  Future<int> deleteUserById(int id) {
    return _localDataSource.deleteById(id);
  }

  @override
  Stream<List<UserDomain>> observerUsers() {
    // Map từ Stream<User> -> Stream<List<UserDomain>>
    return _localDataSource.observeUsers().map(
          (driftUsers) => driftUsers.map((e) => e.toDomain()).toList(),
    );
  }
}