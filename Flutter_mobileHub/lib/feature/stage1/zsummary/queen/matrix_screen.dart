import 'package:flutter/material.dart';

// 1. Màn hình chính: Quản lý danh sách và Theme
class MatrixScreenSummary extends StatefulWidget {
  @override
  _MatrixScreenState createState() => _MatrixScreenState();
}

class _MatrixScreenState extends State<MatrixScreenSummary> {
  List<String> cardIds = ['Card A', 'Card B', 'Card C'];
  bool isBlueTheme = true;

  @override
  Widget build(BuildContext context) {
    print('Building MatrixScreen (Cha)'); // Log để quan sát
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Ma Trận Thẻ Bài')),
        body: Column(
          children: [
            // Nút đổi theme
            ElevatedButton(
              onPressed: () => setState(() => isBlueTheme = !isBlueTheme),
              child: Text('Đổi Theme Màu (Hiện tại: ${isBlueTheme ? "Xanh" : "Đỏ"})'),
            ),
            // Nút đảo ngược danh sách
            ElevatedButton(
              onPressed: () => setState(() => cardIds = cardIds.reversed.toList()),
              child: Text('Đảo ngược danh sách'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cardIds.length,
                itemBuilder: (context, index) {
                  final id = cardIds[index];
                  final mainColor = isBlueTheme ? Colors.blue : Colors.red;

                  return CardItem(
                    key: ValueKey(id), // 🌟 ĐÂY LÀ CHÌA KHÓA (KEY) 🌟
                    id: id,
                    themeColor: mainColor,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 2. Widget trung gian: Stateless, dùng BuildContext để lấy dữ liệu
class CardItem extends StatelessWidget {
  final String id;
  final Color themeColor;

  const CardItem({
    Key? key, // Nhận Key từ cha
    required this.id,
    required this.themeColor
  }) : super(key: key); // 🌟 Phải truyền key lên super() 🌟

  @override
  Widget build(BuildContext context) {
    print('Building CardItem (Stateless) cho: $id');

    // Sử dụng BuildContext để "với" lấy dữ liệu (tương tự LocalXXX.current trong Compose)
    // Ở đây ta giả lập việc dùng context để tạo một hiệu ứng phụ thuộc vào cây UI
    final brightness = Theme.of(context).brightness;

    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: themeColor.withOpacity(0.2),
        border: Border.all(color: themeColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text('$id (Brightness: $brightness)', style: TextStyle(fontWeight: FontWeight.bold)),
          Spacer(),
          // Nhét StatefulWidget vào trong Stateless
          CounterWidget(id: id),
        ],
      ),
    );
  }
}

// 3. Widget trạng thái: Quản lý state nội bộ
class CounterWidget extends StatefulWidget {
  final String id;

  const CounterWidget({Key? key, required this.id}) : super(key: key);

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    print('Building CounterWidget (Stateful) cho: ${widget.id} - Count: $count');

    return Row(
      children: [
        Text('$count', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            // setState chỉ báo cho Flutter biết: "Hãy gọi lại hàm build() của riêng _CounterWidgetState này"
            // Nó KHÔNG gọi lại build() của MatrixScreen hay CardItem
            setState(() {
              count++;
            });
          },
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}