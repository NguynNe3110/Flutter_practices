import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomShell extends StatelessWidget {

  final StatefulNavigationShell navigationShell;

  const BottomShell({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Bottom Navigation"),
      ),

      //----------------------------------
      // Nội dung từng tab
      //----------------------------------

      body: navigationShell,

      //----------------------------------
      // Bottom Navigation
      //----------------------------------

      bottomNavigationBar: BottomNavigationBar(

        currentIndex: navigationShell.currentIndex,

        onTap: (index) {

          navigationShell.goBranch(
            index,

            initialLocation:
            index == navigationShell.currentIndex,
          );

        },

        type: BottomNavigationBarType.fixed,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),

        ],
      ),
    );
  }
}