import 'package:flutter/cupertino.dart';

class UserNameWidget extends StatelessWidget {
  final String name;

  const UserNameWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Text(name + "learn Flutter!");
  }
}