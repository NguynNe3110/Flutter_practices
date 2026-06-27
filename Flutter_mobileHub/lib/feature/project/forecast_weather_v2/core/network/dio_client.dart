import 'package:dio/dio.dart';
import 'package:flutter_mobilehub/feature/project/forecast_weather_v2/core/network/weather_interceptor.dart';

import '../constants/api_constants.dart';

class DioClient {
  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // cách trực tiếp

    // dio.interceptors.add(
    //   InterceptorsWrapper(
    //     onRequest: (options, handler) {
    //       // Thêm query mặc định vào mọi request
    //       options.queryParameters.addAll({
    //         'appid': ApiConstants.apiKey,
    //         'units': ApiConstants.units,
    //         'lang': ApiConstants.lang,
    //       });
    //
    //       handler.next(options);
    //     },
    //
    //     onResponse: (response, handler) {
    //       handler.next(response);
    //     },
    //
    //     onError: (e, handler) {
    //       handler.next(e);
    //     },
    //   ),
    // );
    dio.interceptors.add(WeatherInterceptor());

    // sau này có nhiều interceptor thì
//----
    // dio.interceptors.addAll([
    //   WeatherInterceptor(),
    //   AuthInterceptor(),
    //   LoggerInterceptor(),
    // ]);
    return dio;
  }
}