import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CardAndLoginFormScreen extends StatefulWidget {
  @override
  State<CardAndLoginFormScreen> createState() => _CardAndLoginFormScreen();
}

class _CardAndLoginFormScreen extends State<CardAndLoginFormScreen> {
  String name = "";
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          UserCard(name: name, password: password,),

          SizedBox(height: 20),

          LoginForm(
            onNameChanged: (value) => setState( () {
              name = value;
            }),
            onPasswordChanged: (value) => setState( () => password = value),
          )
        ],
      ),
    );
  }
}
//stateless to display data static
// get data from parent and painted it
class UserCard extends StatelessWidget {
  final String name;
  final String password;

  const UserCard({required this.name, required this.password});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(name),
          Text(password),
        ],
      ),
    );
  }
}


class LoginForm extends StatelessWidget {
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onPasswordChanged;

  const LoginForm({required this.onNameChanged, required this.onPasswordChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
            decoration: InputDecoration(labelText: "Name"),
            // Khi gõ, gọi hàm của cha truyền xuống
          onChanged: onNameChanged
        ),
        TextField(
            decoration: InputDecoration(labelText: "Password"),
            // Khi gõ, gọi hàm của cha truyền xuống
            onChanged: onPasswordChanged
        ),
        ElevatedButton(
            onPressed: () {
          // handle login
        },
            child: Text("Login")
        ),
      ],
    );
  }
}
