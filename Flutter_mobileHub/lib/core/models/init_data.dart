import 'package:flutter/material.dart';
import '../../feature/project/project_screen_manager.dart';
import '../../feature/stage1/stage1_screen_manager.dart';
import '../../feature/stage2/stage2_screen_manager.dart';
import '../../feature/stage3/stage3_screen_manager.dart';
import '../../feature/stage4/stage4_screen_manager.dart';
import '../../feature/stage5/stage5_screen_manager.dart';
import '../../feature/stage6/stage6_screen_manager.dart';
import '../../feature/stage7/stage7_screen_manager.dart';
import '../../feature/test/test_screen_manager.dart';
import 'lesson.dart';

class AppData {
  static List<Lesson> get lessons => [
    Lesson(
      title: 'Folder Project',
      description: 'Complex Lesson',
      screen: ProjectScreen(),
    ),
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
    Lesson(
      title: 'Folder Stage 3',
      description: 'Complex Lesson',
      screen: Stage3Screen(),
    ),
    Lesson(
      title: 'Folder Stage 4',
      description: 'Complex Lesson',
      screen: Stage4Screen(),
    ),
    Lesson(
      title: 'Folder Stage 5',
      description: 'Data layer: tầng dữ liệu',
      screen: Stage5Screen(),
    ),
    Lesson(
      title: 'Folder Stage 6',
      description: 'Complex Lesson',
      screen: Stage6Screen(),
    ),
    Lesson(
      title: 'Folder Stage 7',
      description: 'Complex Lesson',
      screen: Stage7Screen(),
    ),


    // Thêm bài mới vào đây...
    Lesson(
      title: 'Folder Test',
      description: 'Complex Lesson',
      screen: TestScreen(),
    ),
  ];
}
