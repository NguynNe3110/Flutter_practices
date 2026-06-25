
import 'user_remote_data_source.dart';
import 'package:flutter_mobilehub/feature/stage5/dio_basic_mvvm/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource _userRemote;

  @override
  Future<List<UserDomain>> getUsers() {
    return _userRemote.getUsers().map(()
  }
}