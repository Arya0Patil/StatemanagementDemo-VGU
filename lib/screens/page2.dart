import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_demo/screens/providers/counterProvider.dart';

class Page2 extends StatelessWidget {
  final int counter;
  const Page2({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page2")),
      body: Center(
          child: Text(Provider.of<counterProvider>(context, listen: false)
              .counter
              .toString())),
    );
  }
}
