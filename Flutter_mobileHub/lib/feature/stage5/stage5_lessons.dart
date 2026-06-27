import '../../../core/models/lesson.dart';
import 'learn20_1_dio_first/users_screen.dart';
import 'learn20_2_dio_basic_mvvm/user_screen.dart';
import 'learn20_3_dio_freezed/users_screen.dart';

final List<Lesson> stage5Lessons = [
  Lesson(
    title: 'Bài 20_1: learn20_1_dio_first',
    description: 'get user',
    routePath: 'learn20-1-dio-first',
    screen: UsersScreen1(),
  ),
  Lesson(
    title: 'Bài 20_2: learn20_2_dio_basic_mvvm',
    description: 'get user',
    routePath: 'learn20-2-dio-basic-mvvm',
    screen: UsersScreen2(),
  ),
  Lesson(
    title: 'Bài 20_3: dio with freezed dto',
    description: 'get user',
    routePath: 'learn20-3-dio-with-freezed',
    screen: UsersScreen3(),
  ),
];
