import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("Home")),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "t",
            child: Icon(Icons.list),
            onPressed: () {
              Navigator.of(context).pushNamed("/list");
            },
          ),
          FloatingActionButton(
            heroTag: "s",
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed("/add");
            },
          ),
        ],
      ),
    );
  }
}
