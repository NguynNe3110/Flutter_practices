import 'package:drift/drift.dart';

// Map từ CurrentWeatherEntity (Đã phẳng hóa các object Main, Wind, Sys...)
class CurrentWeatherTable extends Table {
  // 🔑 PRIMARY KEY: Dùng tên thành phố làm khóa chính (mỗi thành phố chỉ có 1 trạng thái hiện tại)
  TextColumn get cityName => text()();

  // 🌡️ Map từ MainEntity
  RealColumn get temp => real()();
  RealColumn get feelsLike => real()();
  RealColumn get tempMin => real()();
  RealColumn get tempMax => real()();
  IntColumn get pressure => integer()();
  IntColumn get humidity => integer()();

  // ☁️ Map từ WeatherConditionEntity (Lấy phần tử đầu tiên của List conditions)
  TextColumn get conditionName => text()();
  TextColumn get conditionDescription => text()();
  TextColumn get conditionIcon => text()();

  // 💨 Map từ WindEntity
  RealColumn get windSpeed => real()();
  IntColumn get windDeg => integer()();
  RealColumn get windGust => real().nullable()();

  // ☁️ Map từ CloudsEntity
  IntColumn get cloudsAll => integer()();

  // 👁️ Visibility
  IntColumn get visibility => integer()();

  // 🕒 Map từ SysEntity & dt
  IntColumn get dt => integer()();
  TextColumn get country => text()();
  IntColumn get sunrise => integer()();
  IntColumn get sunset => integer()();

  // ⏱️ LOGIC: Lưu timestamp để UI hiển thị "Cập nhật 5 phút trước"
  IntColumn get lastUpdated => integer()();

  @override
  Set<Column> get primaryKey => {cityName};
}