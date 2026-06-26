import 'package:go_router/go_router.dart';

import 'stage6_screen_manager.dart';

class Stage6Route {
  static final List<RouteBase> stage6Route = [
    GoRoute(
      path: '/stage6',
      builder: (context, state) => Stage6Screen(),
      routes: listLessonInStage6
          .map(
            (lesson) => GoRoute(
              path: lesson.routePath,
              builder: (context, state) => lesson.screen!,
            ),
          )
          .toList(),
    ),
  ];
}
