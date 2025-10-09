import 'dart:math';

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
  Color _backgroundColor = Colors.white;

  final List<String> _titles = [
    "Apprendre les interactifs",
    "I Love Flutter",
    "Eat, Sleep, Code, Repeat",
  ];

  int _titleIndex = 0;
  int _count = 0;
  double _iconSize = 16;

  _updateCount() {
    setState(() {
      _count++;
    });
  }

  _updateBackground() {
    setState(() {
      _backgroundColor = (_backgroundColor == Colors.white
          ? Colors.black54
          : Colors.white);
    });
  }

  _updateLongPress() {
    setState(() {
      _backgroundColor = (_backgroundColor == Colors.white
          ? Colors.deepOrangeAccent
          : Colors.white);
    });
  }

  CrossAxisAlignment _alignement = CrossAxisAlignment.center;

  _setToStart() {
    setState(() {
      _alignement = CrossAxisAlignment.start;
    });
  }

  _setToEnd() {
    setState(() {
      _alignement = CrossAxisAlignment.end;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_titleIndex]),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: _backgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: _alignement,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: _updateBackground,
              onLongPress: _updateLongPress,
              child: Text("TexteButton"),
            ),
            TextButton.icon(
              onPressed: _updateBackground,
              label: Icon(Icons.palette),
              onLongPress: _updateLongPress,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  int newRandomTitle = Random().nextInt(_titles.length);
                  _titleIndex = newRandomTitle;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [Icon(Icons.edit), Text("Changer le titre")],
              ),
            ),
            FilledButton(onPressed: _setToStart, child: Text("Start")),
            FilledButton.tonal(onPressed: _setToEnd, child: Text("End")),
            FilledButton.tonalIcon(
              onPressed: () {
                setState(() {
                  _alignement = CrossAxisAlignment.center;
                });
              },
              label: Icon(Icons.restart_alt),
            ),
            OutlinedButton(
              onPressed: _updateCount,
              child: Text("J'ai appuyé le bouton $_count fois"),
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  width: 1.5,
                  color: Colors.redAccent,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            IconButton.filled(
              onPressed: () {
                setState(() {
                  _iconSize = Random().nextInt(250).toDouble();
                });
              },
              icon: Icon(Icons.add, size: _iconSize),
            ),
          ],
        ),
      ),
    );
  }
}
