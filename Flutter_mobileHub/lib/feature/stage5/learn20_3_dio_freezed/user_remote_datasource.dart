import 'dart:convert';

import 'package:dio/dio.dart';
import 'user_dto.dart';

class UserRemoteDataSource {
  final Dio _dio;

  UserRemoteDataSource(this._dio);

  Future<List<UserDto>> getUsers() async {
    try {
      final response = await _dio.get('/users');

      //parse json array sang list<UserDto>
      final List<dynamic> data = response.data;
      return data.map((json) => UserDto.fromJson(json)).toList();
    } on DioException catch (e) {
      throw Exception('Lỗi mạng: ${e.message}');
    }
  }
}