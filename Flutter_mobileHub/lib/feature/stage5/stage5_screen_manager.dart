import 'package:flutter/material.dart';
import 'package:flutter_mobilehub/feature/stage2/riverpod_first/feature/main/home/home_screen.dart';
import '../../../core/models/lesson.dart';
import 'dio_first/users_screen.dart';

import 'dio_basic_mvvm/user_screen.dart';

final List<Lesson> listLessonInStage5 = [



  // Lesson(
  //   title: 'Bài 2: drift_first',
  //   description: 'sau',
  //   screen: UserListScreen(),
  // ),


  Lesson(
    title: 'Bài 20_1: dio_first',
    description: 'get user',
    screen: UsersScreen1(),
  ),

  Lesson(
    title: 'Bài 20_2: dio_basic_mvvm',
    description: 'get user',
    screen: UsersScreen2(),
  ),
];


class Stage5Screen extends StatelessWidget {
  // Lấy danh sách từ AppData
  final List<Lesson> lessons = listLessonInStage5;

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
              'List In Folder Stage2',
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
