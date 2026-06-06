import 'package:flutter/material.dart';
import '../models/lesson.dart';
import '../../feature/learn1_core/learn1_core.dart';


class HomeScreen extends StatelessWidget {
  // Danh sách bài học - chỉ cần thêm vào đây khi học bài mới
  final List<Lesson> lessons = [
    Lesson(
      id: '1',
      title: 'Bài 1: Column / Row / Box',
      description: 'Layout cơ bản trong Flutter',
      screen: Lesson1ColumnRow(),
    ),
    // Lesson(
    //   id: '2',
    //   title: 'Bài 2: Widget & Modifier',
    //   description: 'TextField, Button, Image',
    //   icon: Icons.widgets,
    //   screen: Lesson2WidgetModifier(),
    // ),
    // Lesson(
    //   id: '3',
    //   title: 'Bài 3: List & Page',
    //   description: 'ListView, GridView, PageView',
    //   icon: Icons.list,
    //   screen: Lesson3ListPage(),
    // ),
    // Thêm bài mới vào đây...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F0FF), // Màu tím nhạt giống ảnh
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.school, color: Colors.black87),
            SizedBox(width: 8),
            Text(
              'Hub Học Flutter',
              style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      lesson.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                lesson.description,
                style: TextStyle(color: Colors.grey[600], fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}