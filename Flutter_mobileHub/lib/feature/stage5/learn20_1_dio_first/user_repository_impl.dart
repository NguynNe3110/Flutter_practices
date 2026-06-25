import 'user_remote_datasource.dart';
import 'user_repository.dart';
import 'user_domain.dart';

// Map sang Kotlin: class UserRepositoryImpl @Inject constructor(...) : UserRepository
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<UserDomain>> getUsers() async {
    // 1. Gọi API lấy DTO
    final dtos = await _remoteDataSource.getUsers();
    // 2. Map DTO sang Entity (Domain không được biết DTO)
    return dtos.map((dto) => dto.toDomain()).toList();
  }
}