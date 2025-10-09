import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<String> values = ["Chat", "Chien", "Renard"];
  String _selected = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.settings),
            onSelected: (newValue) {
              setState(() {
                _selected = newValue;
              });
            },
            itemBuilder: (context) {
              return values.map((animal) {
                return PopupMenuItem<String>(
                  value: animal,
                  child: Text(animal),
                );
              }).toList();
            },
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(child: Text(_selected)),
    );
  }
}
