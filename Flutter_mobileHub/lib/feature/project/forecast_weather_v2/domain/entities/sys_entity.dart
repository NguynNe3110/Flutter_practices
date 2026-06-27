class SysEntity {
  final String country;
  final int sunrise; // Timestamp
  final int sunset;  // Timestamp

  const SysEntity({
    required this.country,
    required this.sunrise,
    required this.sunset,
  });
}