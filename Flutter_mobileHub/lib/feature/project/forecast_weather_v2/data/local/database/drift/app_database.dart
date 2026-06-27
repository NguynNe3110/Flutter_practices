import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/current_weather_table.dart';
import 'tables/forecast_item_table.dart';
import 'daos/weather_dao.dart';

part 'app_database.g.dart';

// Khai báo các Bảng và DAO được sử dụng
@DriftDatabase(tables: [CurrentWeatherTable, ForecastItemTable], daos: [WeatherDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1; // 🚨 Quan trọng: Mỗi lần sửa Table, phải tăng số này lên (giống Room version)
}

// Hàm mở kết nối đến file SQLite trên thiết bị
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'weather_app.sqlite'));

    // Tạo background isolate để không làm đơ UI khi query nặng
    return NativeDatabase.createInBackground(file);
  });
}