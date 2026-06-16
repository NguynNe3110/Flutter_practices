import 'package:flutter/material.dart';
import 'package:flutter_mobilehub/feature/stage1/stateFulWidget/screenCounterChat.dart';
import 'package:flutter_mobilehub/feature/stage1/stateFulWidget/screenProductCardQueen.dart';
import 'package:flutter_mobilehub/feature/stage1/stateless_widget/screen.dart';
import 'package:flutter_mobilehub/feature/stage1/zsummary/chatgpt/shopping_screen.dart';
import 'package:flutter_mobilehub/feature/stage1/zsummary/queen/matrix_screen.dart';
import '../../../core/models/lesson.dart';
import 'firstGen/dart_basic.dart';
import 'firstGen/first_gen.dart';

final List<Lesson> listLessonInStage1 = [

  Lesson(
    title: 'Bài *: Column / Row / Box',
    description: 'Layout cơ bản trong Flutter',
    screen: firstGen(),
  ),

  Lesson(
    title: 'Bài *: dartBasic',
    description: 'basic, bien, ham, string, mang',
    screen: Dartbasic(),
  ),

  Lesson(
    title: 'Bài 1: stateless widget',
    description: 'co ban mo dau',
    screen: Screen_stateless_widget(),
  ),

  Lesson(
    title: 'Bài 2: stateful widget Queen',
    description: 'co ban mo dau',
    screen: ProductCardWidget(),
  ),

  Lesson(
    title: 'Bài 2_1: stateful widge Chat',
    description: 'co ban mo dau',
    screen: CounterScreen(),
  ),

  Lesson(
    title: 'ShoppingScreenSummary Chat',
    description: 'co ban mo dau',
    screen: ShoppingScreenSummary(),
  ),

  Lesson(
    title: 'ShoppingScreenSummary Chat',
    description: 'co ban mo dau',
    screen: MatrixScreenSummary(),
  ),







];


class Stage1Screen extends StatelessWidget {
  // Lấy danh sách từ AppData
  final List<Lesson> lessons = listLessonInStage1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFFE4FFFD),
        elevation: 3,
        title: Row(
          children: [
            Icon(Icons.eighteen_up_rating_outlined, color: Colors.black87),
            SizedBox(width: 8),
            Text(
              'List In Folder Stage1',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: lessons.isEmpty
            ? Center(
          child: Text(
            'Chưa có bài học nào',
            style: TextStyle(color: Colors.grey),
          ),
        )
            : ListView.builder(
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            final lesson = lessons[index];
            return _buildLessonCard(context, lesson);
          },
        ),
      ),
    );
  }

  Widget _buildLessonCard(BuildContext context, Lesson lesson) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => lesson.screen),
          );
        },
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            children: [
              // Icon bài học
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color(0xFFBBE1FF),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Color(0xFF39AAFF)),
                ),
              ),
              SizedBox(width: 16),
              // Thông tin bài học
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lesson.title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      lesson.description,
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                    ),
                  ],
                ),
              ),
              // Mũi tên
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}
