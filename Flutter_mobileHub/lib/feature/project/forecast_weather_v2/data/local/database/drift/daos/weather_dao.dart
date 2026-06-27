// lib/data/local/database/drift/daos/weather_dao.dart
import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/current_weather_table.dart';
import '../tables/forecast_item_table.dart';

part 'weather_dao.g.dart';

@DriftAccessor(tables: [CurrentWeatherTable, ForecastItemTable])
class WeatherDao extends DatabaseAccessor<AppDatabase> with _$WeatherDaoMixin {
  WeatherDao(AppDatabase db) : super(db);

  // ================= CURRENT WEATHER =================

  // 1. Hàm Insert (Map từ @Insert(onConflict = REPLACE))
  Future<void> upsertCurrentWeather(CurrentWeatherTableCompanion data) {
    return into(currentWeatherTable).insertOnConflictUpdate(data);
  }

  // 2. Hàm Watch (Map từ @Query + Flow trong Room)
  // Tự động phát ra dữ liệu mới mỗi khi bảng currentWeatherTable có sự thay đổi
  Stream<CurrentWeatherTableData?> watchCurrentWeather(String cityName) {
    return (select(currentWeatherTable)..where((t) => t.cityName.equals(cityName)))
        .watchSingleOrNull();
  }

  // ================= FORECAST =================

  Future<void> upsertForecastItems(List<ForecastItemTableCompanion> items) async {
    // Xóa cũ và thêm mới (hoặc dùng logic upsert tùy theo Primary Key)
    await batch((batch) {
      batch.insertAll(forecastItemTable, items, mode: InsertMode.insertOrReplace);
    });
  }

  Stream<List<ForecastItemTableData>> watchForecastItems(String cityName) {
    return (select(forecastItemTable)
      ..where((t) => t.cityName.equals(cityName))
      ..orderBy([(t) => OrderingTerm.asc(t.dt)]))
        .watch();
  }
}