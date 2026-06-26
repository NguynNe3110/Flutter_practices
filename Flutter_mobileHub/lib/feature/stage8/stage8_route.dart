import 'package:go_router/go_router.dart';

import 'stage8_screen_manager.dart';

class Stage8Route {
  static final List<RouteBase> stage8Route = [
    GoRoute(path: '/stage8', builder: (context, state) => Stage8Screen()),
  ];
}
