import 'package:flutter_mobilehub/feature/stage3/learn13_1_go_route_basic/learn13_1_route.dart';
import 'package:flutter_mobilehub/feature/stage3/learn13_3_go_route_bottom_navigate/learn13_3_route.dart';
import 'package:go_router/go_router.dart';

import 'stage3_screen_manager.dart';

class Stage3Route {
  static final List<RouteBase> stage3Route = [
    GoRoute(
        path: '/stage3',
        builder: (context, state) => Stage3Screen(),
      routes: [
        ...Learn13_1Route.learn13_1Routes,
        ...Learn13_3Route.learn13_3Routes,

      ]
    ),

  ];
}
