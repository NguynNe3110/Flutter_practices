import 'dart:async';

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
    state = state.copyWith(
      selectedCity: city,
      isLoading: true,
      errorMessage: null,
    );

    try {
      await Future.wait([
        _repository.refreshCurrentWeather(city),
        _repository.refreshForecastWeather(city),
      ]);

      final currentWeather = await _repository.watchCurrentWeather(city).first;
      final forecastWeather = await _repository
          .watchForecastWeather(city)
          .first;

      state = state.copyWith(
        isLoading: false,
        currentWeather: currentWeather,
        forecastWeather: forecastWeather,
      );
    } catch (e) {
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
