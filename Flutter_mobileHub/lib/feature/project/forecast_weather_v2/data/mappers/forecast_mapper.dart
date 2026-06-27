// lib/data/mappers/forecast_mapper.dart
import 'package:drift/drift.dart';
import 'package:flutter_mobilehub/feature/project/forecast_weather_v2/data/mappers/weather_mapper.dart';
import '../../domain/entities/forecast_item_entity.dart';
import '../../domain/entities/forecast_weather_entity.dart';
import '../../domain/entities/main_entity.dart';
import '../../domain/entities/weather_condition_entity.dart';
import '../../domain/entities/wind_entity.dart';
import '../../domain/entities/clouds_entity.dart';
import '../local/database/drift/app_database.dart';
import '../local/database/drift/tables/forecast_item_table.dart';
import '../remote/models/forecast_weather_response.dart';
import '../remote/models/responses/forecast_item_dto.dart';

// ================= 1. DTO -> ENTITY (CHO REMOTE DATASOURCE) =================

// Map wrapper ForecastWeatherResponse
extension ForecastWeatherResponseMapper on ForecastWeatherResponse {
  ForecastWeatherEntity toEntity() {
    return ForecastWeatherEntity(
      cod: cod,
      message: message,
      cnt: cnt,
      list: list.map((e) => e.toEntity()).toList(),
    );
  }
}

// Map từng item trong list
extension ForecastItemDtoMapper on ForecastItemDto {
  ForecastItemEntity toEntity() {
    return ForecastItemEntity(
      dt: dt,
      main: main.toEntity(), // Dùng extension từ common_mapper
      conditions: weather.map((e) => e.toEntity()).toList(),
      clouds: clouds.toEntity(),
      wind: wind.toEntity(),
      visibility: visibility,
      pop: pop,
      rainAmount: rain?.h3,
      pod: sys.pod,
    );
  }
}

// ================= 2. ENTITY -> TABLE COMPANION (ĐỂ LƯU DB) =================
extension ForecastItemEntityMapper on ForecastItemEntity {
  // 🌟 Nhận thêm cityName để fill vào cột cityName của Table
  ForecastItemTableCompanion toTableCompanion(String cityName) {
    final firstCondition = conditions.isNotEmpty ? conditions.first : null;

    return ForecastItemTableCompanion(
      cityName: Value(cityName),
      dt: Value(dt),

      // Map từ MainEntity
      temp: Value(main.temp),
      feelsLike: Value(main.feelsLike),
      tempMin: Value(main.tempMin),
      tempMax: Value(main.tempMax),
      pressure: Value(main.pressure),
      humidity: Value(main.humidity),

      // Map từ WeatherConditionEntity
      conditionName: Value(firstCondition?.conditionName ?? ''),
      conditionDescription: Value(firstCondition?.description ?? ''),
      conditionIcon: Value(firstCondition?.iconCode ?? ''),

      // Map từ WindEntity
      windSpeed: Value(wind.speed),
      windDeg: Value(wind.deg),

      // Map từ CloudsEntity
      cloudsAll: Value(clouds.all),
      visibility: Value(visibility),

      // Map từ các field khác
      pop: Value(pop),
      rainAmount: Value(rainAmount),
      pod: Value(pod),
    );
  }
}

// ================= 3. TABLE DATA -> ENTITY (ĐỂ ĐỌC TỪ DB) =================
extension ForecastItemTableDataMapper on ForecastItemTableData {
  ForecastItemEntity toEntity() {
    return ForecastItemEntity(
      dt: dt,
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
          id: 0,
          conditionName: conditionName,
          description: conditionDescription,
          iconCode: conditionIcon,
        )
      ],
      clouds: CloudsEntity(all: cloudsAll),
      wind: WindEntity(speed: windSpeed, deg: windDeg),
      visibility: visibility,
      pop: pop,
      rainAmount: rainAmount,
      pod: pod,
    );
  }
}