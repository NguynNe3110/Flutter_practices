import 'package:dio/dio.dart';

import '../constants/api_constants.dart';

class WeatherInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
      ) {
    options.queryParameters.addAll({
      'appid': ApiConstants.apiKey,
      'units': ApiConstants.units,
      'lang': ApiConstants.lang,
    });

    super.onRequest(options, handler);
  }
}