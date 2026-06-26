import 'package:flutter_mobilehub/feature/stage5/stage5_route.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_mobilehub/core/screens/home_screen.dart';
import 'package:flutter_mobilehub/feature/project/forecast_weather/ui/get_started.dart';
import 'package:flutter_mobilehub/feature/project/project_screen_manager.dart';
import 'package:flutter_mobilehub/feature/stage1/firstGen/dart_basic.dart';
import 'package:flutter_mobilehub/feature/stage1/firstGen/first_gen.dart';
import 'package:flutter_mobilehub/feature/stage1/stage1_screen_manager.dart';
import 'package:flutter_mobilehub/feature/stage1/stateFulWidget/screenCounterChat.dart';
import 'package:flutter_mobilehub/feature/stage1/stateFulWidget/screenProductCardQueen.dart';
import 'package:flutter_mobilehub/feature/stage1/stateless_widget/screen.dart';
import 'package:flutter_mobilehub/feature/stage1/zsummary/chatgpt/shopping_screen.dart';
import 'package:flutter_mobilehub/feature/stage1/zsummary/queen/matrix_screen.dart';
import 'package:flutter_mobilehub/feature/stage2/riverpod_first/feature/main/home/home_screen.dart';
import 'package:flutter_mobilehub/feature/stage2/stage2_screen_manager.dart';
import 'package:flutter_mobilehub/feature/stage3/stage3_screen_manager.dart';
import 'package:flutter_mobilehub/feature/stage4/stage4_screen_manager.dart';
import 'package:flutter_mobilehub/feature/stage6/stage6_screen_manager.dart';
import 'package:flutter_mobilehub/feature/stage6/drift_first/feature/screen.dart';
import 'package:flutter_mobilehub/feature/stage7/stage7_screen_manager.dart';
import 'package:flutter_mobilehub/feature/stage8/stage8_screen_manager.dart';
import 'package:flutter_mobilehub/feature/test/test_screen_manager.dart';
import 'package:flutter_mobilehub/feature/test/feature/card_and_loginform.dart';

final GoRouter appRouter = GoRouter(
  //initialLocation: màn hình đầu tiên của navGraph này
  initialLocation: '/',

  //route : danh sach cac  distinations cap cao nhat
  routes: [
    GoRoute(
      //path : chuoi url dinh danh cho man hinh
      path: '/',

      //builder: ham duoc goi de ve ra widget khi path duoc match
      // context : dufng de lay them, kich thuoc man hinh...
      //state: chua thong tin truyen den (path parameter, extra data, query params)
      builder: (context, state) => HomeScreen(),
    ),

    GoRoute(
      path: '/project',
      builder: (context, state) => ProjectScreen(),
      routes: [
        GoRoute(
          path: 'forecast-weather',
          builder: (context, state) => GetStarted(),
        ),
      ],
    ),

    GoRoute(
      path: '/stage1',
      builder: (context, state) => Stage1Screen(),
      routes: [
        GoRoute(path: 'first-gen', builder: (context, state) => firstGen()),
        GoRoute(path: 'dart-basic', builder: (context, state) => Dartbasic()),
        GoRoute(
          path: 'stateless-widget',
          builder: (context, state) => Screen_stateless_widget(),
          routes: [
            //SOMETHING
          ],
        ),
        GoRoute(
          path: 'stateful-widget-queen',
          builder: (context, state) => ProductCardWidget(),
        ),
        GoRoute(
          path: 'stateful-widget-chat',
          builder: (context, state) => CounterScreen(),
        ),
        GoRoute(
          path: 'shopping-summary-chat',
          builder: (context, state) => ShoppingScreenSummary(),
        ),
        GoRoute(
          path: 'matrix-card-queen',
          builder: (context, state) => MatrixScreenSummary(),
        ),
      ],
    ),

    GoRoute(
      path: '/stage2',
      builder: (context, state) => Stage2Screen(),
      routes: [
        GoRoute(
          path: 'riverpod-first',
          builder: (context, state) => HomeScreenst2(),
        ),
      ],
    ),

    GoRoute(path: '/stage3', builder: (context, state) => Stage3Screen()),

    GoRoute(path: '/stage4', builder: (context, state) => Stage4Screen()),

    ...Stage5Route.stage5Route,

    // GoRoute(
    //   path: '/stage5',
    //   builder: (context, state) => Stage5Screen(),
    //   routes: [
    //     GoRoute(
    //       path: 'learn20-1-dio-first',
    //       builder: (context, state) => UsersScreen1(),
    //     ),
    //     GoRoute(
    //       path: 'learn20-2-dio-basic-mvvm',
    //       builder: (context, state) => UsersScreen2(),
    //     ),
    //   ],
    // ),
    GoRoute(
      path: '/stage6',
      builder: (context, state) => Stage6Screen(),
      routes: [
        GoRoute(
          path: 'drift-first',
          builder: (context, state) => UserListScreen(),
        ),
      ],
    ),

    GoRoute(path: '/stage7', builder: (context, state) => Stage7Screen()),

    GoRoute(path: '/stage8', builder: (context, state) => Stage8Screen()),

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
  ],
);
