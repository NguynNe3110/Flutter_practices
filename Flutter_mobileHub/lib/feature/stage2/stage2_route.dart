import 'package:go_router/go_router.dart';

import 'stage2_screen_manager.dart';

class Stage2Route {
  static final List<RouteBase> stage2Route = [
    GoRoute(
      path: '/stage2',
      builder: (context, state) => Stage2Screen(),
      routes: listLessonInStage2
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
