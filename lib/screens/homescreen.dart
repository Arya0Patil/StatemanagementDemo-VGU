import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_demo/screens/page2.dart';
import 'package:state_management_demo/screens/providers/counterProvider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Color color = Colors.red;

  void _incrementCounter() {
    Provider.of<counterProvider>(context, listen: false).addCount();
    // setState(() {
    //   _counter++;
    // });
  }

  void _changeColor() {
    setState(() {
      color = Colors.green;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              //
              Provider.of<counterProvider>(context, listen: true)
                  .counter
                  .toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Container(
              height: 100,
              width: 100,
              color: color,
            ),
            ElevatedButton(
                onPressed: () {
                  _changeColor();
                },
                child: Text("Change color to green")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => Page2(
                        counter: 5,
                      ),
                    ),
                  );
                },
                child: Text("Navigate to page2"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
