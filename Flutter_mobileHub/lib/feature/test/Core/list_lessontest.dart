import 'package:flutter_mobilehub/feature/test/Core/test_screen.dart';

import '../../../core/models/lesson.dart';
import '../feature/card_and_loginform.dart';

final List<Lesson> listLessonInTest = [
    Lesson(
      id: '1',
      title: 'Bài *: Column / Row / Box',
      description: 'Layout cơ bản trong Flutter',
      screen: CardAndLoginFormScreen(),
    ),
  ];
