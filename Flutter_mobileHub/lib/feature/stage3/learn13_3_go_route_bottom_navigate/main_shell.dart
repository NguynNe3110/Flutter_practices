import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // 1. Lấy đường dẫn hiện tại (Tương đương currentBackStackEntry trong Android)
    final currentLocation = GoRouterState.of(context).matchedLocation;

    // 2. Tính toán index dựa trên đường dẫn
    // Lưu ý: Đường dẫn lúc này là dạng tuyệt đối, ví dụ: '/stage3/home', '/stage3/search'
    int currentIndex = _calculateSelectedIndex(currentLocation);

    return Scaffold(
      // 'child' ở đây chính là NavHost của Android.
      // GoRouter tự động inject màn hình con (Home, Search...) vào đây.
      body: child,

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,

        // 🌟 QUAN TRỌNG: Phải set màu thì nó mới highlight rõ ràng trong Material 3
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        showUnselectedLabels: true,

        onTap: (index) {
          // 3. Xử lý khi click tab (Tương đương onItemClick trong Android)
          _onItemTapped(context, index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }

  // Tách hàm riêng cho sạch code (Giống cách ta tách hàm trong Compose)
  int _calculateSelectedIndex(String location) {
    // In ra console để bạn tự debug xem chuỗi thực tế nó là gì
    print('--- CURRENT LOCATION: $location ---');

    // Dùng contains thay vì endsWith hoặc startsWith để tránh lỗi thừa thiếu dấu /
    if (location.contains('home')) return 0;
    if (location.contains('search')) return 1;
    if (location.contains('profile')) return 2;
    if (location.contains('settings')) return 3;

    return 0; // Default về Home
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/stage3/home');
        break;
      case 1:
        context.go('/stage3/search');
        break;
      case 2:
        context.go('/stage3/profile');
        break;
      case 3:
        context.go('/stage3/settings');
        break;
    }
  }
}