import 'lesson.dart';

// import 'package:flutter_mobilehub/feature/stage1/stage1_screen_manager.dart';

class AppData {
  static List<Lesson> get lessons => [
    Lesson(
      title: 'Folder Project',
      description: 'Complex Lesson',
      routePath: '/project',
    ),
    Lesson(
      title: 'Folder Stage 1',
      description: 'Flutter Foundation (Nền tảng)',
      routePath: '/stage1',
    ),
    Lesson(
      title: 'Folder Stage 2',
      description: 'Flutter State (Quản lý trạng thái)',
      routePath: '/stage2',
    ),
    Lesson(
      title: 'Folder Stage 3',
      description: 'Navigation (Điều hướng)',
      routePath: '/stage3',
    ),
    Lesson(
      title: 'Folder Stage 4',
      description: 'Architecture (Kiến trúc)',
      routePath: '/stage4',
    ),
    Lesson(
      title: 'Folder Stage 5',
      description: 'Data layer: tầng dữ liệu',
      routePath: '/stage5',
    ),
    Lesson(
      title: 'Folder Stage 6',
      description: 'Local Database (Cơ sở dữ liệu cục bộ)',
      routePath: '/stage6',
    ),
    Lesson(
      title: 'Folder Stage 7',
      description: 'Dependency Injection (Tiêm phụ thuộc)',
      routePath: '/stage7',
    ),
    Lesson(
      title: 'Folder Stage 8',
      description: 'Production Flutter',
      routePath: '/stage8',
    ),

    // Thêm bài mới vào đây...
    Lesson(
      title: 'Folder Test',
      description: 'Complex Lesson',
      routePath: '/test',
    ),
  ];
}
