
import 'user_dto.dart';
import 'user_remote_data_source.dart';
import 'user_repository.dart';
import 'user_domain.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource _userRemote;

  UserRepositoryImpl(this._userRemote);

  @override
  Future<List<UserDomain>> getUsers() async {
    // ben kia parse sang json ròi, ơ đay chỉ can lấy
    final List<UserDto> jsonList = await _userRemote.getUsers();

    // map sang domain, nếu khong phải , map json sang dto trước
    return jsonList.map((dto) => dto.toDomain()).toList();
  }
}