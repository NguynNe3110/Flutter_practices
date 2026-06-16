import 'package:flutter/material.dart';

class Lesson {
  final String title;
  final String description;
  final Widget screen; // Màn hình tương ứng

  Lesson({
    required this.title,
    required this.description,
    required this.screen,
  });
}
