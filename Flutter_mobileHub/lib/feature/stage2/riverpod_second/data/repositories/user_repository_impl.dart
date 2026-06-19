
import 'package:flutter_mobilehub/feature/stage2/riverpod_first/data/remote/datasources/mock_remote_datasource.dart';
import 'package:flutter_mobilehub/feature/stage2/riverpod_first/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository{
  final MockRemoteDatasource _datasource;
  UserRepositoryImpl(this._datasource);

  @override
  Future<List<String>> getUser() {
    return _datasource.getUsers(); //
  }

  // @override
  // Future<List<String>> getUser() => _datasource.getUsers();
}