import 'package:go_router/go_router.dart';

import '../home/home_screen.dart';

class HomeRoute {
  static final List<RouteBase> homeRoute = [
    GoRoute(
      path: '/forecast-weather',
      builder: (context, state) => const HomeScreen(),
    ),
  ];
}
