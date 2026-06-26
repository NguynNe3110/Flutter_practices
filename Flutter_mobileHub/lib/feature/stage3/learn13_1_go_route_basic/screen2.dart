import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Screen2 extends StatelessWidget {
  final String messageFromScreen1;

  const Screen2({super.key, required this.messageFromScreen1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Dữ liệu nhận được: $messageFromScreen1'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Truyền số nguyên sang Screen 3
                context.push('/screen3', extra: 2024);
              },
              child: const Text('Đi tới Screen 3 (Truyền Int)'),
            ),
          ],
        ),
      ),
    );
  }
}