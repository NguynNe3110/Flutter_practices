
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CounterScreenState();
  }
}

class _CounterScreenState extends State<CounterScreen> {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter demo, code genered by ChatGpt"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,// truc chinh theo column
        crossAxisAlignment: CrossAxisAlignment.center, // truc phu column

        children: [
          Text(
            "Count: $count",
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold
            ),
          ),

          const SizedBox(height: 20), // khoang trong

          ElevatedButton(
              onPressed: () {
            // handle event
              },
              child: const Text("Increase"),
          ),
        ],
      ),
    );
  }
}