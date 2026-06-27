import 'package:go_router/go_router.dart';
import 'login_screen.dart';
import 'main_shell.dart';
import 'search_screen.dart';
import 'setting_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';


// final GoRouter learn13_3_route = GoRouter(
//   // initialLocation: '/login', // Màn hình đầu tiên khi mở app
//   routes: [
//     // Route cho màn hình Login
//     GoRoute(
//       path: '/login',
//       name: 'login',
//       builder: (context, state) => const LoginScreen(),
//     ),
//
//     // ShellRoute: Giữ lại Bottom Navigation, chỉ thay đổi nội dung bên trong
//     ShellRoute(
//       builder: (context, state, child) {
//         return MainShell(child: child);
//       },
//       routes: [
//         GoRoute(path: '/home', builder: (c, s) => const HomeScreen()),
//         GoRoute(path: '/search', builder: (c, s) => const SearchScreen()),
//         GoRoute(path: '/profile', builder: (c, s) => const ProfileScreen()),
//         GoRoute(path: '/settings', builder: (c, s) => const SettingsScreen()),
//       ],
//     ),
//   ],
// );

class Learn13_3Route {
  // 1. Định nghĩa constant tránh hardcode
  static const String login = 'learn13_3';
  static const String home = 'home';
  static const String search = 'search';
  static const String profile = 'profile';
  static const String settings = 'settings';

  // 2. Xuất ra List<RouteBase> (Chứa cả GoRoute và ShellRoute)
  static final List<RouteBase> learn13_3Routes = [
    GoRoute(
      path: login,
      name: login,
      builder: (context, state) => const LoginScreen(),
    ),

    // ShellRoute vẫn hoạt động bình thường khi được nest
    ShellRoute(
      builder: (context, state, child) {
        return MainShell(child: child);
      },
      routes: [
        GoRoute(path: home, builder: (c, s) => const HomeScreen()),
        GoRoute(path: search, builder: (c, s) => const SearchScreen()),
        GoRoute(path: profile, builder: (c, s) => const ProfileScreen()),
        GoRoute(path: settings, builder: (c, s) => const SettingsScreen()),
      ],
    ),
  ];
}