import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'widgets/weather_item.dart';
import 'home_notifier.dart';
import 'home_state.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeNotifierProvider);
    final notifier = ref.read(homeNotifierProvider.notifier);

    return Scaffold(
      backgroundColor: const Color(0xffF3F7FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        titleSpacing: 20,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                'assets/project_forecast_weather/profile.png',
                width: 42,
                height: 42,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: state.selectedCity,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down_rounded),
                  items: _cities
                      .map(
                        (city) =>
                            DropdownMenuItem(value: city, child: Text(city)),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    notifier.loadWeather(value);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: notifier.refresh,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
          children: [
            if (state.errorMessage != null) ...[
              _ErrorBanner(message: state.errorMessage!),
              const SizedBox(height: 16),
            ],
            _CurrentWeatherHeader(state: state),
            const SizedBox(height: 24),
            _MetricsRow(state: state),
            const SizedBox(height: 24),
            _SectionTitle(
              title: 'Forecast',
              subtitle: '3-hour blocks from OpenWeather',
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 170,
              child:
                  state.forecastWeather == null ||
                      state.forecastWeather!.list.isEmpty
                  ? _LoadingCard(isLoading: state.isLoading)
                  : ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.forecastWeather!.list.take(8).length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final item = state.forecastWeather!.list[index];
                        final weather = item.conditions.isNotEmpty
                            ? item.conditions.first
                            : null;
                        return _ForecastCard(
                          title: DateFormat('EEE, HH:mm').format(
                            DateTime.fromMillisecondsSinceEpoch(item.dt * 1000),
                          ),
                          temperature: item.main.temp.round(),
                          description: weather?.conditionName ?? 'N/A',
                          assetPath: _weatherAssetFor(
                            weather?.conditionName ?? '',
                            clouds: item.clouds.all,
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

const List<String> _cities = ['Hanoi', 'Nam Dinh', 'Da Nang','Hai Phong', 'Can Tho', 'Thai Nguyen', 'Ho Chi Minh City', 'Tokyo'];

String _weatherAssetFor(String conditionName, {int clouds = 0}) {
  final normalized = conditionName.toLowerCase();

  if (normalized.contains('thunder'))
    return 'assets/project_forecast_weather/thunderstorm.png';
  if (normalized.contains('snow'))
    return 'assets/project_forecast_weather/snow.png';
  if (normalized.contains('sleet'))
    return 'assets/project_forecast_weather/sleet.png';
  if (normalized.contains('rain') || normalized.contains('drizzle')) {
    return clouds > 65
        ? 'assets/project_forecast_weather/heavyrain.png'
        : 'assets/project_forecast_weather/lightrain.png';
  }
  if (normalized.contains('cloud')) {
    return clouds > 70
        ? 'assets/project_forecast_weather/heavycloud.png'
        : 'assets/project_forecast_weather/lightcloud.png';
  }
  if (normalized.contains('mist') ||
      normalized.contains('fog') ||
      normalized.contains('haze')) {
    return 'assets/project_forecast_weather/lightcloud.png';
  }

  return 'assets/project_forecast_weather/clear.png';
}

class _CurrentWeatherHeader extends StatelessWidget {
  const _CurrentWeatherHeader({required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final currentWeather = state.currentWeather;
    final weather = currentWeather?.conditions.isNotEmpty == true
        ? currentWeather!.conditions.first
        : null;

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff1E2A57),
        borderRadius: BorderRadius.circular(28),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                _weatherAssetFor(
                  weather?.conditionName ?? '',
                  clouds: currentWeather?.clouds.all ?? 0,
                ),
                width: 64,
                height: 64,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentWeather?.cityName ?? state.selectedCity,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      weather?.description ?? 'Loading weather data',
                      style: TextStyle(
                        color: Colors.white.withOpacity(.75),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                currentWeather == null
                    ? '--'
                    : '${currentWeather.main.temp.round()}°',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            currentWeather == null
                ? 'Waiting for the first sync'
                : DateFormat('EEEE, d MMMM').format(
                    DateTime.fromMillisecondsSinceEpoch(
                      currentWeather.dt * 1000,
                    ),
                  ),
            style: TextStyle(
              color: Colors.white.withOpacity(.75),
              fontSize: 14,
            ),
          ),
          if (state.isLoading) ...[
            const SizedBox(height: 12),
            const LinearProgressIndicator(minHeight: 2),
          ],
        ],
      ),
    );
  }
}

class _MetricsRow extends StatelessWidget {
  const _MetricsRow({required this.state});

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    final currentWeather = state.currentWeather;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        weatherItem(
          text: 'Wind Speed',
          value: currentWeather?.wind.speed.round() ?? 0,
          unit: 'm/s',
          imageUrl: 'assets/project_forecast_weather/windspeed.png',
        ),
        weatherItem(
          text: 'Humidity',
          value: currentWeather?.main.humidity ?? 0,
          unit: '%',
          imageUrl: 'assets/project_forecast_weather/humidity.png',
        ),
        weatherItem(
          text: 'Max Temp',
          value: currentWeather?.main.tempMax.round() ?? 0,
          unit: '°',
          imageUrl: 'assets/project_forecast_weather/max-temp.png',
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 13, color: Colors.black.withOpacity(.55)),
        ),
      ],
    );
  }
}

class _ForecastCard extends StatelessWidget {
  const _ForecastCard({
    required this.title,
    required this.temperature,
    required this.description,
    required this.assetPath,
  });

  final String title;
  final int temperature;
  final String description;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 18,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          Center(child: Image.asset(assetPath, width: 52, height: 52)),
          Text(
            '$temperature°',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black.withOpacity(.55),
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xffffe7e7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(message, style: const TextStyle(color: Color(0xff9c1b1b))),
    );
  }
}

class _LoadingCard extends StatelessWidget {
  const _LoadingCard({required this.isLoading});

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (!isLoading) {
      return const SizedBox.shrink();
    }

    return const Center(
      child: Padding(
        padding: EdgeInsets.only(top: 16),
        child: CircularProgressIndicator(),
      ),
    );
  }
}
