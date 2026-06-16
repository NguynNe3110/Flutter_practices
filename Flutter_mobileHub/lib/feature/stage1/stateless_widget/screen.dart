import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobilehub/feature/stage1/stateless_widget/username_widget.dart';

class Screen_stateless_widget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("data"),
      ),
      body: Column(
        children: [
          UserNameWidget(name: "nguyen",),
          UserNameWidget(name: "uzuu"),
          MyScreen()
        ],
      ),
    );
  }
}

class MyScreen extends StatefulWidget {
  // Hàm nhà máy: Nhiệm vụ duy nhất là gắn "Mạch điện" vào "Vỏ tivi"
  @override
  _genWithQueen createState() => _genWithQueen();
}

class _genWithQueen extends State<MyScreen> {
  int count = 0;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("count : $count"),
        ElevatedButton(
          onPressed: () {
            setState( () {
              count++;
            });
          },
          child: Text("Increase"),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                count = 0;
              });
            },
            child: Text("Reset count"),
        ),
      ],
    );
  }
}