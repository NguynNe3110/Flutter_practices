import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dio_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dio_client.dart';

// 1. Provider tạo Dio (Singleton toàn cục - Map sang @Provides @Singleton trong NetworkModule)
final dioProvider = Provider((ref) => DioClient.createDio());