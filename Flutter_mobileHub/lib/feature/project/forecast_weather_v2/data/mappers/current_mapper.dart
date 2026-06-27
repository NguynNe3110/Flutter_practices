// lib/data/mappers/current_weather_mapper.dart
import 'package:drift/drift.dart';
import 'package:flutter_mobilehub/feature/project/forecast_weather_v2/data/mappers/weather_mapper.dart';
import '../../domain/entities/current_weather_entity.dart';
import '../../domain/entities/main_entity.dart';
import '../../domain/entities/weather_condition_entity.dart';
import '../../domain/entities/wind_entity.dart';
import '../../domain/entities/clouds_entity.dart';
import '../../domain/entities/sys_entity.dart';
import '../local/database/drift/app_database.dart';
import '../local/database/drift/tables/current_weather_table.dart';
import '../remote/models/current_weather_response.dart';

// ================= 1. DTO -> ENTITY (CHO REMOTE DATASOURCE) =================
extension CurrentWeatherResponseMapper on CurrentWeatherResponse {
  CurrentWeatherEntity toEntity() {
    return CurrentWeatherEntity(
      cityName: name,
      conditions: weather.map((e) => e.toEntity()).toList(), // Dùng extension từ common_mapper
      main: main.toEntity(),
      visibility: visibility,
      wind: wind.toEntity(),
      clouds: clouds.toEntity(),
      dt: dt,
      sys: sys.toEntity(),
    );
  }
}

// ================= 2. ENTITY -> TABLE COMPANION (ĐỂ LƯU DB) =================
extension CurrentWeatherEntityMapper on CurrentWeatherEntity {
  CurrentWeatherTableCompanion toTableCompanion() {
    final firstCondition = conditions.isNotEmpty ? conditions.first : null;

    return CurrentWeatherTableCompanion(
      cityName: Value(cityName),

      // Map từ MainEntity
      temp: Value(main.temp),
      feelsLike: Value(main.feelsLike),
      tempMin: Value(main.tempMin),
      tempMax: Value(main.tempMax),
      pressure: Value(main.pressure),
      humidity: Value(main.humidity),

      // Map từ WeatherConditionEntity (Lấy phần tử đầu tiên)
      conditionName: Value(firstCondition?.conditionName ?? ''),
      conditionDescription: Value(firstCondition?.description ?? ''),
      conditionIcon: Value(firstCondition?.iconCode ?? ''),

      // Map từ WindEntity
      windSpeed: Value(wind.speed),
      windDeg: Value(wind.deg),
      windGust: Value(wind.gust),

      // Map từ CloudsEntity
      cloudsAll: Value(clouds.all),
      visibility: Value(visibility),

      // Map từ SysEntity & dt
      dt: Value(dt),
      country: Value(sys.country),
      sunrise: Value(sys.sunrise),
      sunset: Value(sys.sunset),
    );
  }
}

// ================= 3. TABLE DATA -> ENTITY (ĐỂ ĐỌC TỪ DB) =================
extension CurrentWeatherTableDataMapper on CurrentWeatherTableData {
  CurrentWeatherEntity toEntity() {
    return CurrentWeatherEntity(
      cityName: cityName,
      main: MainEntity(
        temp: temp,
        feelsLike: feelsLike,
        tempMin: tempMin,
        tempMax: tempMax,
        pressure: pressure,
        humidity: humidity,
      ),
      conditions: [
        WeatherConditionEntity(
          id: 0, // DB không lưu id của condition, set tạm 0
          conditionName: conditionName,
          description: conditionDescription,
          iconCode: conditionIcon,
        )
      ],
      wind: WindEntity(speed: windSpeed, deg: windDeg, gust: windGust),
      clouds: CloudsEntity(all: cloudsAll),
      visibility: visibility,
      dt: dt,
      sys: SysEntity(country: country, sunrise: sunrise, sunset: sunset),
    );
  }
}