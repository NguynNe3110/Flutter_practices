import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobilehub/core/app_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    ProviderScope(
      // thao tác với riverpod
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      //  bọc theem .route để có thể go route
      debugShowCheckedModeBanner: false,
      title: 'Hub Học Flutter',
      theme: ThemeData(primarySwatch: Colors.purple),
      routerConfig: appRouter, // nhúng route vào build
      // home: HomeScreen(),// cấu hình theo navigator 1.0 bản cũ,
      // bản mới 2.0 là đăng kí màn hình ở file config vd appRoute()
    );
  }
}
