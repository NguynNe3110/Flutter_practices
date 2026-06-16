import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  final String name;
  final int price;
  final int quantity;

  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    required this.onIncrease,
    required this.onDecrease,
  });

  Color getCardColor() {

    if (quantity >= 5) {
      return Colors.red.shade100;
    }

    if (quantity >= 1) {
      return Colors.green.shade100;
    }

    return Colors.grey.shade300;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: getCardColor(),
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              "Giá: $price đ",
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                IconButton(
                  onPressed: onDecrease,
                  icon: const Icon(Icons.remove),
                ),

                Text(
                  quantity.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),

                IconButton(
                  onPressed: onIncrease,
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}