// static final GoRouter router = GoRouter(
//   initialLocation: "/login",
//
//   routes: [
//
//     //---------------------------------------
//     // Login
//     //---------------------------------------
//     GoRoute(
//       path: "/login",
//       builder: (context, state) => const LoginScreen(),
//     ),
//
//     //---------------------------------------
//     // Bottom Navigation
//     //---------------------------------------
//     StatefulShellRoute.indexedStack(
//
//       builder: (context, state, navigationShell) {
//         return BottomShell(
//           navigationShell: navigationShell,
//         );
//       },
//
//       branches: [
//
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               path: "/home",
//               builder: (_, __) => const HomeScreen(),
//             ),
//           ],
//         ),
//
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               path: "/search",
//               builder: (_, __) => const SearchScreen(),
//             ),
//           ],
//         ),
//
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               path: "/profile",
//               builder: (_, __) => const ProfileScreen(),
//             ),
//           ],
//         ),
//
//         StatefulShellBranch(
//           routes: [
//             GoRoute(
//               path: "/settings",
//               builder: (_, __) => const SettingsScreen(),
//             ),
//           ],
//         ),
//       ],
//     ),
//   ],
// );
// }