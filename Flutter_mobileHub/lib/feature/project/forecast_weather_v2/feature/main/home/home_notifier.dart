import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/di/weather_provider.dart';
import '../../../domain/repositories/weather_repository.dart';
import 'home_state.dart';

class HomeNotifier extends Notifier<HomeState> {
  final String debug = "IN HomeNotifier";
  late final WeatherRepository _repository;

  @override
  HomeState build() {
    _repository = ref.read(weatherRepositoryProvider);

    const initialState = HomeState();
    Future.microtask(() => loadWeather(initialState.selectedCity));
    return initialState;
  }

  Future<void> loadWeather(String city) async {
    debugPrint('[DEBUG] $debug city load data: $city');

    state = state.copyWith(
      selectedCity: city,
      isLoading: true,
      errorMessage: null,
    );

    try {
      debugPrint('[DEBUG] $debug call refreshCurrentWeather, refreshForecastWeather...');
      await Future.wait([
        _repository.refreshCurrentWeather(city),
        _repository.refreshForecastWeather(city),
      ]);
      debugPrint('[DEBUG] $debug success call');

      debugPrint('[DEBUG] $debug read data from cache...');
      final currentWeather = await _repository.watchCurrentWeather(city).first;
      final forecastWeather = await _repository
          .watchForecastWeather(city)
          .first;

      debugPrint('[DEBUG] $debug read data from cache success: current=${currentWeather != null}, forecast=${forecastWeather != null}');

      state = state.copyWith(
        isLoading: false,
        currentWeather: currentWeather,
        forecastWeather: forecastWeather,
      );
    } catch (e, stackTrace) {

      debugPrint('[DEBUG] $debug Lỗi khi load thời tiết: $e');
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
