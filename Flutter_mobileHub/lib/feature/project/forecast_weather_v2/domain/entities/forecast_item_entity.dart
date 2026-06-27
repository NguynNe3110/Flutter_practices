import 'main_entity.dart';
import 'weather_condition_entity.dart';
import 'wind_entity.dart';
import 'clouds_entity.dart';

class ForecastItemEntity {
  final int dt;               // Timestamp
  final MainEntity main;
  final List<WeatherConditionEntity> conditions;
  final CloudsEntity clouds;
  final WindEntity wind;
  final int visibility;
  final double? pop;          // Probability of precipitation (0-1)
  final double? rainAmount;   // Map từ RainDto.h3 (lượng mưa 3h)
  final String pod;           // ("d" = day, "n" = night)

  const ForecastItemEntity({
    required this.dt,
    required this.main,
    required this.conditions,
    required this.clouds,
    required this.wind,
    required this.visibility,
    this.pop,
    this.rainAmount,
    required this.pod,
  });
}