import 'package:go_router/go_router.dart';
import 'package:flutter_mobilehub/core/screens/home_screen.dart';
import 'package:flutter_mobilehub/feature/project/project_route.dart';
import 'package:flutter_mobilehub/feature/stage1/stage1_route.dart';
import 'package:flutter_mobilehub/feature/stage2/stage2_route.dart';
import 'package:flutter_mobilehub/feature/stage3/stage3_route.dart';
import 'package:flutter_mobilehub/feature/stage4/stage4_route.dart';
import 'package:flutter_mobilehub/feature/stage5/stage5_route.dart';
import 'package:flutter_mobilehub/feature/stage6/stage6_route.dart';
import 'package:flutter_mobilehub/feature/stage7/stage7_route.dart';
import 'package:flutter_mobilehub/feature/stage8/stage8_route.dart';
import 'package:flutter_mobilehub/feature/test/test_route.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => HomeScreen()),
    ...ProjectRoute.projectRoute,
    ...Stage1Route.stage1Route,
    ...Stage2Route.stage2Route,
    ...Stage3Route.stage3Route,
    ...Stage4Route.stage4Route,
    ...Stage5Route.stage5Route,
    ...Stage6Route.stage6Route,
    ...Stage7Route.stage7Route,
    ...Stage8Route.stage8Route,
    ...TestRoute.testRoute,
  ],
);
