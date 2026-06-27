import '../../core/error/app_exception.dart';
import '../../domain/entities/current_weather_entity.dart';
import '../../domain/entities/forecast_weather_entity.dart';
import '../../domain/repositories/weather_repository.dart';
import '../local/datasources/weather_local_data_source.dart';
import '../remote/datasources/weather_remote_data_source.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource _remote;
  final WeatherLocalDataSource _local;

  WeatherRepositoryImpl(this._remote, this._local);

  @override
  Stream<CurrentWeatherEntity?> watchCurrentWeather(String city) {
    return _local.watchCurrentWeather(city);
  }

  @override
  Future<void> refreshCurrentWeather(String city) async {
    try {
      final entity = await _remote.getCurrentWeather(city);
      await _local.saveCurrentWeather(entity);
    } on CacheException {
      // Ném lại lỗi cache vì đây là lỗi nghiêm trọng
      rethrow;
    } on NetworkException {
      // Bỏ qua lỗi network, cho phép app dùng dữ liệu cache cũ
      // Không làm gì cả, app sẽ tiếp tục hiển thị dữ liệu cũ từ stream
    } on ServerException {
      // Ném lại lỗi server
      rethrow;
    } catch (e) {
      // Wrap các lỗi không xác định thành UnknownException
      throw UnknownException("Lỗi không xác định khi làm mới thời tiết: $e");
    }
  }

  @override
  Stream<ForecastWeatherEntity?> watchForecastWeather(String city) {
    return _local.watchForecastWeather(city);
  }

  @override
  Future<void> refreshForecastWeather(String city) async {
    try {
      final entity = await _remote.getForecastWeather(city);
      await _local.saveForecastWeather(city, entity);
    } on CacheException {
      // Ném lại lỗi cache vì đây là lỗi nghiêm trọng
      rethrow;
    } on NetworkException {
      // Bỏ qua lỗi network, cho phép app dùng dữ liệu cache cũ
      // Không làm gì cả, app sẽ tiếp tục hiển thị dữ liệu cũ từ stream
    } on ServerException {
      // Ném lại lỗi server
      rethrow;
    } catch (e) {
      // Wrap các lỗi không xác định thành UnknownException
      throw UnknownException("Lỗi không xác định khi làm mới dự báo: $e");
    }
  }
}
