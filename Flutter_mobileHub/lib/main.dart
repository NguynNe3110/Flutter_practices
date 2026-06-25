import 'package:flutter/material.dart';
import 'package:flutter_mobilehub/feature/stage3/learn13_go_route_basic/app_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/screens/home_screen.dart';

void main() {
  runApp(
    ProviderScope(  // thao tác với riverpod
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router( //  bọc theem .route để có thể go route
      debugShowCheckedModeBanner: false,
      title: 'Hub Học Flutter',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routerConfig: appRouter, // nhúng route vào build
      // home: HomeScreen(),// cấu hình theo navigator 1.0 bản cũ,
      // bản mới 2.0 là đăng kí màn hình ở file config vd appRoute()
    );
  }
}