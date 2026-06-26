

// neen dinh nghia cac route trong screen tranh hardcode
import 'package:flutter_mobilehub/feature/stage3/learn13_1_go_route_basic/screen1.dart';
import 'package:flutter_mobilehub/feature/stage3/learn13_1_go_route_basic/screen3.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';
import 'screen2.dart';

class Learn13_1Route {
  static const String screen1 = 'screen1';
  static const String screen2 = 'screen2';
  static const String screen3 = 'screen3';


//cau hinh route cho man hinh
static final List<RouteBase> learn13_1Routes = [
  GoRoute(
    path: Learn13_1Route.screen1,
    builder: (context, state) => const Screen1(),
  ),

  GoRoute(
      path: Learn13_1Route.screen2,
      builder: (context, state) {
        // truyen du lieu giua cac man hinh
        final message = state.extra as String? ?? 'Khong co du lieu';

        return Screen2(messageFromScreen1: message);
      },
  ),

  GoRoute(path: Learn13_1Route.screen3,
    builder: (context, state) {
      final number = state.extra as int? ?? 0;

      return Screen3(numberFromScreen2: number);
    }
  )
];
}