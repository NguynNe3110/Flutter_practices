import 'package:go_router/go_router.dart';

import 'stage1_screen_manager.dart';

class Stage1Route {
  static final List<RouteBase> stage1Route = [
    GoRoute(
      path: '/stage1',
      builder: (context, state) => Stage1Screen(),
      routes: listLessonInStage1
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
