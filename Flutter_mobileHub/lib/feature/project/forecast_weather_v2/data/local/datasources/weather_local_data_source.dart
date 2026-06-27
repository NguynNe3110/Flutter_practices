// lib/feature/project/forecast_weather_v2/data/local/datasources/weather_local_datasource.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobilehub/feature/project/forecast_weather_v2/data/local/database/drift/daos/weather_dao.dart';
import 'package:flutter_mobilehub/feature/project/forecast_weather_v2/data/mappers/current_mapper.dart';
import 'package:flutter_mobilehub/feature/project/forecast_weather_v2/data/mappers/forecast_mapper.dart';
import 'package:flutter_mobilehub/feature/project/forecast_weather_v2/domain/entities/current_weather_entity.dart';
import 'package:flutter_mobilehub/feature/project/forecast_weather_v2/domain/entities/forecast_weather_entity.dart';

import '../../../core/error/app_exception.dart';

class WeatherLocalDataSource {
  final WeatherDao _weatherDao;

  WeatherLocalDataSource(this._weatherDao);

  // 1. HÀM LƯU: Nhận Entity -> Map sang TableCompanion -> Gọi DAO
  Future<void> saveCurrentWeather(CurrentWeatherEntity entity) async {
    try {
      final tableCompanion = entity.toTableCompanion();
      await _weatherDao.upsertCurrentWeather(tableCompanion);
      debugPrint('✅ [CACHE] Lưu thành công thời tiết hiện tại cho ${entity.cityName}');
    } catch (e, stackTrace) {
      debugPrint('❌ [CACHE] Lỗi khi lưu dữ liệu xuống DB: $e');
      debugPrint('Stack trace: $stackTrace');
      // Không ném CacheException nữa, chỉ log lỗi để app vẫn hoạt động
      // Vì dữ liệu đã lấy được từ API, chỉ là không lưu được vào cache thôi
    }
  }

  // 2. HÀM ĐỌC (STREAM): Gọi DAO watch -> Map TableData sang Entity -> Trả về Stream
  Stream<CurrentWeatherEntity?> watchCurrentWeather(String city) {
    return _weatherDao.watchCurrentWeather(city).map((tableData) {
      if (tableData == null) return null;
      return tableData.toEntity();
    });
  }

  Future<void> saveForecastWeather(
    String city,
    ForecastWeatherEntity entity,
  ) async {
    try {
      final items = entity.list
          .map((item) => item.toTableCompanion(city))
          .toList();
      await _weatherDao.upsertForecastItems(items);
      debugPrint('✅ [CACHE] Lưu thành công dự báo thời tiết cho $city (${entity.list.length} mục)');
    } catch (e, stackTrace) {
      debugPrint('❌ [CACHE] Lỗi khi lưu forecast xuống DB: $e');
      debugPrint('Stack trace: $stackTrace');
      // Không ném CacheException nữa, chỉ log lỗi để app vẫn hoạt động
    }
  }

  Stream<ForecastWeatherEntity?> watchForecastWeather(String city) {
    return _weatherDao.watchForecastItems(city).map((tableDataList) {
      if (tableDataList.isEmpty) return null;
      return ForecastWeatherEntity(
        cod: '200',
        message: 0,
        cnt: tableDataList.length,
        list: tableDataList.map((tableData) => tableData.toEntity()).toList(),
      );
    });
  }
}
