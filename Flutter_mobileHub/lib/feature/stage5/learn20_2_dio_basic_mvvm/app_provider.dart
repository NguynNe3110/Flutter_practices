

import 'package:dio/dio.dart';
import 'dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


//hoăc viet duoi dạng hàm mũi tên
final dioProvider = Provider((ref) {
  return DioClient.createDio();
});