import 'package:flutter_mobilehub/feature/project/forecast_weather_v2/domain/entities/current_weather_entity.dart';
import 'package:flutter_mobilehub/feature/project/forecast_weather_v2/domain/entities/forecast_weather_entity.dart';

class HomeState {
  final String selectedCity;
  final bool isLoading;
  final CurrentWeatherEntity? currentWeather;
  final ForecastWeatherEntity? forecastWeather;
  final String? errorMessage;

  const HomeState({
    this.selectedCity = 'London',
    this.isLoading = false,
    this.currentWeather,
    this.forecastWeather,
    this.errorMessage,
  });

  HomeState copyWith({
    String? selectedCity,
    bool? isLoading,
    CurrentWeatherEntity? currentWeather,
    ForecastWeatherEntity? forecastWeather,
    String? errorMessage,
  }) {
    return HomeState(
      selectedCity: selectedCity ?? this.selectedCity,
      isLoading: isLoading ?? this.isLoading,
      currentWeather: currentWeather ?? this.currentWeather,
      forecastWeather: forecastWeather ?? this.forecastWeather,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
