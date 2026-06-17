import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartSummary extends StatelessWidget {

  final int totalItem;
  final int totalPrice;

  const CartSummary({
    super.key,
    required this.totalItem,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [

                  Text(
                    "Tổng sản phẩm: $totalItem",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    "Tổng tiền: $totalPrice đ",
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),

                  const SizedBox(height: 8),

                  if (totalItem == 0)
                    const Text(
                      "Giỏ hàng trống",
                    ),

                  if (totalPrice >= 1000000)
                    const Text(
                      "🎉 Bạn được giảm giá",
                    ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}