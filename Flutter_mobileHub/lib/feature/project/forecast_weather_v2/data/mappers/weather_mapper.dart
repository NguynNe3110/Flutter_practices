// lib/data/mappers/weather_mapper.dart
import '../../domain/entities/main_entity.dart';
import '../../domain/entities/weather_condition_entity.dart';
import '../../domain/entities/wind_entity.dart';
import '../../domain/entities/clouds_entity.dart';
import '../../domain/entities/sys_entity.dart';
import '../remote/models/current_weather_response.dart';
import '../remote/models/responses/clouds_dto.dart';
import '../remote/models/responses/main_dto.dart';
import '../remote/models/responses/weather_dto.dart';
import '../remote/models/responses/wind_dto.dart'; // Chứa SysDto

// 1. MainDto -> MainEntity
extension MainDtoMapper on MainDto {
  MainEntity toEntity() => MainEntity(
    temp: temp,
    feelsLike: feelsLike,
    tempMin: tempMin,
    tempMax: tempMax,
    pressure: pressure,
    humidity: humidity,
  );
}

// 2. WeatherDto -> WeatherConditionEntity
extension WeatherDtoMapper on WeatherDto {
  WeatherConditionEntity toEntity() => WeatherConditionEntity(
    id: id,
    conditionName: main,
    description: description,
    iconCode: icon,
  );
}

// 3. WindDto -> WindEntity
extension WindDtoMapper on WindDto {
  WindEntity toEntity() => WindEntity(
    speed: speed,
    deg: deg,
    gust: gust,
  );
}

// 4. CloudsDto -> CloudsEntity
extension CloudsDtoMapper on CloudsDto {
  CloudsEntity toEntity() => CloudsEntity(all: all);
}

// 5. SysDto -> SysEntity
extension SysDtoMapper on SysDto {
  SysEntity toEntity() => SysEntity(
    country: country,
    sunrise: sunrise,
    sunset: sunset,
  );
}