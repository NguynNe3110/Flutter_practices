import 'forecast_item_entity.dart';

class ForecastWeatherEntity {
  final String cod;
  final int message;
  final int cnt;
  final List<ForecastItemEntity> list;

  const ForecastWeatherEntity({
    required this.cod,
    required this.message,
    required this.cnt,
    required this.list,
  });
}