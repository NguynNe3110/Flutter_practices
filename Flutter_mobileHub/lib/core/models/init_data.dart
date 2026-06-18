import 'package:flutter/material.dart';
import '../../feature/stage1/stage1_screen_manager.dart';
import '../../feature/stage2/stage2_screen_manager.dart';
import '../../feature/test/test_screen_manager.dart';
import 'lesson.dart';

class AppData {
  static List<Lesson> get lessons => [
    Lesson(
      title: 'Folder Stage 1',
      description: 'Complex Lesson',
      screen: Stage1Screen(),
    ),
    Lesson(
      title: 'Folder Stage 2',
      description: 'Complex Lesson',
      screen: Stage2Screen(),
    ),



    // Thêm bài mới vào đây...
    Lesson(
      title: 'Folder Test',
      description: 'Complex Lesson',
      screen: TestScreen(),
    ),
  ];
}
