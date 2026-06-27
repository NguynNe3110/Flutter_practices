import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainShell extends StatelessWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    // Lấy đường dẫn hiện tại để highlight đúng Tab đang chọn
    // Tương đương việc đọc currentDestination trong NavController
    final currentLocation = GoRouterState.of(context).matchedLocation;

    int currentIndex = 0;
    if (currentLocation.startsWith('/search')) currentIndex = 1;
    if (currentLocation.startsWith('/profile')) currentIndex = 2;
    if (currentLocation.startsWith('/settings')) currentIndex = 3;

    return Scaffold(
      body: child, // <-- Đây là nội dung của Tab (Home, Search, etc.)

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          // Khi bấm vào Tab, dùng context.go() để chuyển route
          // KHÔNG dùng context.push() vì không muốn chồng màn hình Tab lên nhau
          switch (index) {
            case 0: context.go('/stage3/home'); break;
            case 1: context.go('/stage3/search'); break;
            case 2: context.go('/stage3/profile'); break;
            case 3: context.go('/stage3/settings'); break;
          }
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
}