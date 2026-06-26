import 'package:go_router/go_router.dart';

import 'feature/card_and_loginform.dart';
import 'test_screen_manager.dart';

class TestRoute {
  static final List<RouteBase> testRoute = [
    GoRoute(
      path: '/test',
      builder: (context, state) => TestScreen(),
      routes: [
        GoRoute(
          path: 'card-and-login-form',
          builder: (context, state) => CardAndLoginFormScreen(),
        ),
      ],
    ),
  ];
}
