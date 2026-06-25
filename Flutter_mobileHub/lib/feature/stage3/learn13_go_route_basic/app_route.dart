import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screen1.dart';
import 'screen2.dart';
import 'screen3.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/screen1',
  routes: [
    GoRoute(
      path: '/screen1',
      name: 'screen1', // Đặt tên để dễ gọi (giống action ID trong Android)
      builder: (context, state) => const Screen1(),
    ),
    GoRoute(
      path: '/screen2',
      name: 'screen2',
      // Nhận dữ liệu từ state.extra (Tương tự nhận Bundle/Args)
      builder: (context, state) {
        final message = state.extra as String? ?? 'Không có dữ liệu';
        return Screen2(messageFromScreen1: message);
      },
    ),
    GoRoute(
      path: '/screen3',
      name: 'screen3',
      builder: (context, state) {
        final number = state.extra as int? ?? 0;
        return Screen3(numberFromScreen2: number);
      },
    ),
  ],
);