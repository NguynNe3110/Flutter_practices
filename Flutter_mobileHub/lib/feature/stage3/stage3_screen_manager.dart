import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/models/lesson.dart';

final List<Lesson> listLessonInStage3 = [
  // Lesson(
  //   title: 'Bài 1: riverpod',
  //   description: 'sau',
  //   screen: HomeScreenst2(),
  // ),
];

class Stage3Screen extends StatelessWidget {
  Stage3Screen({super.key});

  // Lấy danh sách từ AppData
  final List<Lesson> lessons = listLessonInStage3;

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
              'List In Folder Stage3',
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
          context.push('/stage3/${lesson.routePath}');
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
