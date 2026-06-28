import 'forecast_item_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_forecast_entity.freezed.dart';
// part 'daily_forecast_entity.g.dart';

// class DailyForecastEntity {
//   final DateTime date;               // Ngày tháng (VD: 2023-10-25)
//   final double maxTemp;              // Nhiệt độ cao nhất trong ngày (Max của 8 items)
//   final double minTemp;              // Nhiệt độ thấp nhất trong ngày (Min của 8 items)
//   final String mainCondition;        // Trạng thái đại diện (VD: "Rain" - thường lấy của khung giờ 12:00)
//   final String iconCode;             // Icon đại diện
//
//   // 🌟 Chứa luôn list các item chi tiết của ngày này
//   // Để khi bấm sang Màn hình 3, ta có dữ liệu vẽ luôn không cần query DB lại
//   final List<ForecastItemEntity> hourlyItems;
//
//   const DailyForecastEntity({
//     required this.date,
//     required this.maxTemp,
//     required this.minTemp,
//     required this.mainCondition,
//     required this.iconCode,
//     required this.hourlyItems,
//   });
// }


@freezed
class DailyForecastEntity with _$DailyForecastEntity {
  const factory DailyForecastEntity({
    required DateTime date,
    required double maxTemp,
    required double minTemp,
    required String mainCondition,
    required String iconCode,
    required List<ForecastItemEntity> hourlyItems,
  }) = _DailyForecastEntity;
}