import 'package:go_router/go_router.dart';

import 'project_screen_manager.dart';

class ProjectRoute {
  static final List<RouteBase> projectRoute = [
    GoRoute(
      path: '/project',
      builder: (context, state) => ProjectScreen(),
      routes: listLessonInProject
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
