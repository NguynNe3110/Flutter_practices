class WindEntity {
  final double speed;
  final int deg;
  final double? gust; // Giữ optional vì DTO là double?

  const WindEntity({
    required this.speed,
    required this.deg,
    this.gust,
  });
}