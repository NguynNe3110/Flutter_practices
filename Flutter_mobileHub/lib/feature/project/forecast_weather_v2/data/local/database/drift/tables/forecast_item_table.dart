import 'package:drift/drift.dart';

// Map từ ForecastItemEntity
class ForecastItemTable extends Table {
  IntColumn get id => integer().autoIncrement()(); // 🔑 PRIMARY KEY tự tăng

  // 🔗 FOREIGN KEY (Logic): Để biết item này thuộc thành phố nào
  TextColumn get cityName => text()();

  IntColumn get dt => integer()();

  // 🌡️ Map từ MainEntity
  RealColumn get temp => real()();
  RealColumn get feelsLike => real()();
  RealColumn get tempMin => real()();
  RealColumn get tempMax => real()();
  IntColumn get pressure => integer()();
  IntColumn get humidity => integer()();

  // ☁️ Map từ WeatherConditionEntity (Phần tử đầu tiên)
  TextColumn get conditionName => text()();
  TextColumn get conditionDescription => text()();
  TextColumn get conditionIcon => text()();

  // 💨 Map từ WindEntity
  RealColumn get windSpeed => real()();
  IntColumn get windDeg => integer()();

  IntColumn get cloudsAll => integer()();
  IntColumn get visibility => integer()();

  RealColumn get pop => real().nullable()();
  RealColumn get rainAmount => real().nullable()();
  TextColumn get pod => text()();
}