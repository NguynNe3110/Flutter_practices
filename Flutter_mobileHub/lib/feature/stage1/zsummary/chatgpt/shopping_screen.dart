import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobilehub/feature/stage1/zsummary/chatgpt/product_card.dart';

import 'cart_summary.dart';

class ShoppingScreenSummary extends StatefulWidget {
  const ShoppingScreenSummary({super.key});

  @override
  State<ShoppingScreenSummary> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreenSummary> {

  int shirtCount = 0;
  int pantCount = 0;
  int shoeCount = 0;

  int get totalItem {
    return shirtCount + pantCount + shoeCount;
  }

  int get totalPrice {
    return shirtCount * 100000 +
        pantCount * 200000 +
        shoeCount * 500000;
  }

  void resetCart() {
    setState(() {
      shirtCount = 0;
      pantCount = 0;
      shoeCount = 0;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Đã reset giỏ hàng"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            CartSummary(
              totalItem: totalItem,
              totalPrice: totalPrice,
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView(
                children: [

                  ProductCard(
                    name: "Áo",
                    price: 100000,
                    quantity: shirtCount,
                    onIncrease: () {
                      setState(() {
                        shirtCount++;
                      });
                    },
                    onDecrease: () {
                      if (shirtCount > 0) {
                        setState(() {
                          shirtCount--;
                        });
                      }
                    },
                  ),

                  ProductCard(
                    name: "Quần",
                    price: 200000,
                    quantity: pantCount,
                    onIncrease: () {
                      setState(() {
                        pantCount++;
                      });
                    },
                    onDecrease: () {
                      if (pantCount > 0) {
                        setState(() {
                          pantCount--;
                        });
                      }
                    },
                  ),

                  ProductCard(
                    name: "Giày",
                    price: 500000,
                    quantity: shoeCount,
                    onIncrease: () {
                      setState(() {
                        shoeCount++;
                      });
                    },
                    onDecrease: () {
                      if (shoeCount > 0) {
                        setState(() {
                          shoeCount--;
                        });
                      }
                    },
                  ),
                ],
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: resetCart,
                child: const Text("Reset Cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}