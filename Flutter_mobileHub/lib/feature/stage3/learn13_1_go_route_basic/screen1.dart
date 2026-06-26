import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 1')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // push: Thêm Screen 2 vào Stack (Giống navigate() trong Android)
            // extra: Truyền dữ liệu (Giống putExtra / Bundle)
            context.push(
              '/screen2',
              extra: 'Xin chào từ Screen 1! (String)',
            );
          },
          child: const Text('Đi tới Screen 2 (Truyền String)'),
        ),
      ),
    );
  }
}