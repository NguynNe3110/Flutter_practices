import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("SETTINGS"),

          ElevatedButton(
            onPressed: (){
              context.go("/login");
            },
            child: const Text("Logout"),
          )
        ],
      )
    );
  }
}