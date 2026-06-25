import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Screen3 extends StatelessWidget {
  final int numberFromScreen2;

  const Screen3({super.key, required this.numberFromScreen2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Screen 3')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Dữ liệu nhận được: $numberFromScreen2'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // go(): Điều hướng và THAY THẾ toàn bộ Stack hiện tại.
                // Tương đương Intent với FLAG_ACTIVITY_CLEAR_TASK | FLAG_ACTIVITY_NEW_TASK
                // Nếu dùng context.push('/screen1') thì Stack sẽ là: 1 -> 2 -> 3 -> 1 (bị lặp)
                context.go('/screen1');
              },
              child: const Text('Quay về Screen 1 (Reset Stack)'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // pop(): Quay lại màn hình liền trước (Giống finish() hoặc onBackPressed)
                context.pop();
              },
              child: const Text('Quay lại Screen 2 (Pop Stack)'),
            ),
          ],
        ),
      ),
    );
  }
}