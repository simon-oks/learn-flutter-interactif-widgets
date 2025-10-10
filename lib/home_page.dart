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
  bool isOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: isOn ? Colors.white : Colors.black45,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Couleur de background: ${isOn ? 'Light' : 'Dark'}"),
            Switch(
              value: isOn,
              onChanged: (newBool) {
                setState(() {
                  isOn = newBool;
                });
              },
              activeThumbColor: Colors.redAccent,
              inactiveThumbColor: Colors.orangeAccent,
              inactiveTrackColor: Colors.lightGreenAccent,
              activeTrackColor: Colors.yellow,
            ),
          ],
        ),
      ),
    );
  }
}

class Animal {
  String name;
  String icon;

  Animal(this.name, this.icon);
}
