import 'package:flutter_mobilehub/feature/stage5/dio_first/user_remote_datasource.dart';
import 'package:flutter_mobilehub/feature/stage5/dio_first/user_repository.dart';
import 'package:flutter_mobilehub/feature/stage5/dio_first/user_entity.dart';

// Map sang Kotlin: class UserRepositoryImpl @Inject constructor(...) : UserRepository
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<UserEntity>> getUsers() async {
    // 1. Gọi API lấy DTO
    final dtos = await _remoteDataSource.getUsers();
    // 2. Map DTO sang Entity (Domain không được biết DTO)
    return dtos.map((dto) => dto.toEntity()).toList();
  }
}