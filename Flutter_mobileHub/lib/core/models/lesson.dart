// File: core/models/lesson.dart
import 'package:flutter/material.dart';

class Lesson {
  final String title;
  final String description;
  final String routePath;
  final Widget? screen; // 🌟 Cho phép null (vì HomeScreen không cần)

  Lesson({
    required this.title,
    required this.description,
    required this.routePath,
    this.screen,
  });
}