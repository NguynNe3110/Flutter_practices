import 'package:go_router/go_router.dart';

import 'stage7_screen_manager.dart';

class Stage7Route {
  static final List<RouteBase> stage7Route = [
    GoRoute(path: '/stage7', builder: (context, state) => Stage7Screen()),
  ];
}
