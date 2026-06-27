
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Dùng context.go() để chuyển sang Home và XÓA backstack (không cho back lại login)
            context.go('/stage3/home');
          },
          child: const Text('Login & Enter App'),
        ),
      ),
    );
  }
}