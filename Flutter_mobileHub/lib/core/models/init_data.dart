import 'package:flutter/material.dart';
import '../../feature/project/project_screen_manager.dart';
import '../../feature/stage1/stage1_screen_manager.dart';
import '../../feature/stage2/stage2_screen_manager.dart';
import '../../feature/stage3/stage3_screen_manager.dart';
import '../../feature/stage4/stage4_screen_manager.dart';
import '../../feature/stage5/stage5_screen_manager.dart';
import '../../feature/stage6/stage6_screen_manager.dart';
import '../../feature/stage7/stage7_screen_manager.dart';
import '../../feature/stage8/stage8_screen_manager.dart';
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
      description: 'Flutter Foundation (Nền tảng)',
      screen: Stage1Screen(),
    ),
    Lesson(
      title: 'Folder Stage 2',
      description: 'Flutter State (Quản lý trạng thái)',
      screen: Stage2Screen(),
    ),
    Lesson(
      title: 'Folder Stage 3',
      description: 'Navigation (Điều hướng)',
      screen: Stage3Screen(),
    ),
    Lesson(
      title: 'Folder Stage 4',
      description: 'Architecture (Kiến trúc)',
      screen: Stage4Screen(),
    ),
    Lesson(
      title: 'Folder Stage 5',
      description: 'Data layer: tầng dữ liệu',
      screen: Stage5Screen(),
    ),
    Lesson(
      title: 'Folder Stage 6',
      description: 'Local Database (Cơ sở dữ liệu cục bộ)',
      screen: Stage6Screen(),
    ),
    Lesson(
      title: 'Folder Stage 7',
      description: 'Dependency Injection (Tiêm phụ thuộc)',
      screen: Stage7Screen(),
    ),
    Lesson(
      title: 'Folder Stage 8',
      description: 'Production Flutter',
      screen: Stage8Screen(),
    ),


    // Thêm bài mới vào đây...
    Lesson(
      title: 'Folder Test',
      description: 'Complex Lesson',
      screen: TestScreen(),
    ),
  ];
}
