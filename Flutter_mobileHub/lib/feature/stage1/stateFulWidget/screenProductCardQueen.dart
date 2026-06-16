import 'package:flutter/material.dart';

// 1. CLASS VỎ TIVI (StatefulWidget)
class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({super.key});

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

// 2. CLASS MẠCH ĐIỆN (State) - Nơi chứa dữ liệu và logic
class _ProductCardWidgetState extends State<ProductCardWidget> {

  // 🧠 DỮ LIỆU STATE (Giống mutableStateOf trong Compose)
  bool isLiked = false;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    // 🎨 UI (Vỏ tivi) - Hàm này chạy lại mỗi khi setState() được gọi

    // CONTAINER: Widget "thần thánh" dùng để bọc, tạo nền, padding, margin
    return Container(
      margin: const EdgeInsets.all(16.0), // Giống Modifier.padding(16.dp) ở NGOÀI
      padding: const EdgeInsets.all(20.0), // Giống Modifier.padding(20.dp) ở TRONG

      // DECORATION: Map với Modifier.background + Modifier.clip + Modifier.shadow
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0), // Bo góc 16dp
        boxShadow: [ // Đổ bóng (Compose dùng Modifier.shadow)
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5), // Bóng đổ xuống dưới 5px
          ),
        ],
      ),

      // CHILD: Nội dung bên trong Container
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Giống horizontalAlignment = Start
        mainAxisSize: MainAxisSize.min, // ⚠️ QUAN TRỌNG: Xem giải thích bên dưới
        children: [

          // --- TIÊU ĐỀ ---
          const Text(
            'Áo Thun Flutter Dev',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
          ),

          const SizedBox(height: 8), // Giống Spacer(modifier = Modifier.height(8.dp))

          const Text(
            'Chất liệu cotton 100% thoáng mát cho lập trình viên',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),

          const SizedBox(height: 20),

          // --- HÀNG CHỨA CÁC NÚT BẤM ---
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Giống Arrangement.SpaceBetween
            children: [

              // 1. NÚT LIKE (Dùng GestureDetector để bắt sự kiện chạm)
              // Map với Modifier.clickable { } trong Compose
              GestureDetector(
                onTap: () {
                  // ⚡ GỌI setState ĐỂ CẬP NHẬT UI
                  setState(() {
                    isLiked = !isLiked; // Đảo trạng thái
                  });
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min, // Thu nhỏ Row vừa đủ với Icon và Text
                  children: [
                    Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border, // Icon đổi theo state
                      color: isLiked ? Colors.red : Colors.grey,
                      size: 14,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      isLiked ? 'Đã thích' : 'Thích',
                      style: TextStyle(
                        color: isLiked ? Colors.red : Colors.grey,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
              ),

              // 2. BỘ ĐẾM SỐ LƯỢNG (- 1 +)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), // Padding trái/phải 8, trên/dưới 4
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1), // Nền xanh nhạt
                  borderRadius: BorderRadius.circular(20), // Bo tròn như viên thuốc
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Nút Trừ
                    _buildCounterButton(
                      icon: Icons.remove,
                      onTap: () {
                        if (quantity > 1) { // Logic: Không cho giảm xuống dưới 1
                          setState(() { quantity--; });
                        }
                      },
                    ),

                    // Số lượng (Dùng Padding widget riêng để tạo khoảng cách)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        '$quantity', // Nội suy chuỗi trong Dart dùng dấu $
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),

                    // Nút Cộng
                    _buildCounterButton(
                      icon: Icons.add,
                      onTap: () {
                        setState(() { quantity++; });
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 🛠️ HÀM PHỤ: Tách code cho gọn (Giống việc tách @Composable function trong Compose)
  Widget _buildCounterButton({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap, // VoidCallback map với () -> Unit trong Kotlin
      child: Container(
        width: 30, height: 30,
        decoration: const BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle, // Cắt thành hình tròn (Map với Modifier.clip(CircleShape))
        ),
        child: Icon(icon, color: Colors.white, size: 18),
      ),
    );
  }
}