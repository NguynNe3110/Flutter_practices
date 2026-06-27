

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../network/dio_client.dart';

//hoăc viet duoi dạng hàm mũi tên

final dioProvider = Provider<Dio>((ref) {
  return DioClient.createDio();
});