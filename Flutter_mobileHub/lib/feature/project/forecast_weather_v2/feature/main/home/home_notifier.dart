import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/di/weather_provider.dart';
import '../../../domain/repositories/weather_repository.dart';
import 'home_state.dart';

class HomeNotifier extends Notifier<HomeState> {
  late final WeatherRepository _repository;

  @override
  HomeState build() {
    _repository = ref.read(weatherRepositoryProvider);

    const initialState = HomeState();
    Future.microtask(() => loadWeather(initialState.selectedCity));
    return initialState;
  }

  Future<void> loadWeather(String city) async {
    debugPrint('🏠 [HOME] Bắt đầu load thời tiết cho thành phố: $city');

    state = state.copyWith(
      selectedCity: city,
      isLoading: true,
      errorMessage: null,
    );

    try {
      debugPrint('🔄 [HOME] Gọi refreshCurrentWeather và refreshForecastWeather...');
      await Future.wait([
        _repository.refreshCurrentWeather(city),
        _repository.refreshForecastWeather(city),
      ]);
      debugPrint('✅ [HOME] Refresh thành công cả 2 API');

      debugPrint('📖 [HOME] Đọc dữ liệu từ cache...');
      final currentWeather = await _repository.watchCurrentWeather(city).first;
      final forecastWeather = await _repository
          .watchForecastWeather(city)
          .first;

      debugPrint('✅ [HOME] Đọc cache thành công: current=${currentWeather != null}, forecast=${forecastWeather != null}');

      state = state.copyWith(
        isLoading: false,
        currentWeather: currentWeather,
        forecastWeather: forecastWeather,
      );
    } catch (e, stackTrace) {

      debugPrint('❌ [HOME] Lỗi khi load thời tiết: $e');
      debugPrint('Stack trace: $stackTrace');

      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> refresh() {
    return loadWeather(state.selectedCity);
  }
}

final homeNotifierProvider = NotifierProvider<HomeNotifier, HomeState>(
  HomeNotifier.new,
);
