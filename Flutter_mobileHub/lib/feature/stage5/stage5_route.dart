import 'package:go_router/go_router.dart';

import 'stage5_lessons.dart';
import 'stage5_screen_manager.dart';

class Stage5Route {
  static final List<RouteBase> stage5Route = [
    GoRoute(
      path: '/stage5',
      builder: (context, state) => Stage5Screen(),
      routes: stage5Lessons
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
