import 'package:dio/dio.dart';
import 'user_api.dart';
import 'user_dto.dart';

// nen bắt lloxi ngay ở layer này
class UserRemoteDataSource {
  final UserApi _userApi;

  UserRemoteDataSource(this._userApi);

  // nếu k bắt lỗi try catch tại đây thì k cần await có thể trả về Future cho bên  repo
  Future<List<UserDto>> getUsers() async {
    try {
      return await _userApi.getUsers();
    } on DioException catch(e) {
      throw Exception("Loi khi goi API: ${e.message}");
    }
  }
}