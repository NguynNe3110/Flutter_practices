class WeatherConditionEntity {
  final int id;
  final String conditionName; // Map từ WeatherDto.main ("Clouds", "Rain")
  final String description;
  final String iconCode;      // Map từ WeatherDto.icon ("04d")

  const WeatherConditionEntity({
    required this.id,
    required this.conditionName,
    required this.description,
    required this.iconCode,
  });
}