import 'package:go_router/go_router.dart';

import 'stage4_screen_manager.dart';

class Stage4Route {
  static final List<RouteBase> stage4Route = [
    GoRoute(path: '/stage4', builder: (context, state) => Stage4Screen()),
  ];
}
