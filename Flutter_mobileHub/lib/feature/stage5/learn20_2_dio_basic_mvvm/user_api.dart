
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'user_dto.dart';

part 'user_api.g.dart';

@RestApi() // ✅ Bỏ trống, không khai báo baseUrl nữa
abstract class UserApi {
  factory UserApi(Dio dio, {String? baseUrl}) = _UserApi;

  @GET("/users") // ✅ Đường dẫn sẽ tự nối vào baseUrl của Dio
  Future<List<UserDto>> getUsers();
}