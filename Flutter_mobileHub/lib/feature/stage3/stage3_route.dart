import 'package:go_router/go_router.dart';

import 'stage3_screen_manager.dart';

class Stage3Route {
  static final List<RouteBase> stage3Route = [
    GoRoute(path: '/stage3', builder: (context, state) => Stage3Screen()),
  ];
}
