import 'package:flutter/material.dart';

class ShowUser extends StatelessWidget {
  final String? email;
  final String? pass;
  const ShowUser({super.key, this.email, this.pass});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User Data")),
      body: Center(
        child: Column(
          children: [Text(email.toString()), Text(pass.toString())],
        ),
      ),
    );
  }
}
