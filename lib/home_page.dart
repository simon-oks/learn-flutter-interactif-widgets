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
  final List<Animal> _animals = [
    Animal("Abeille", "🐝"),
    Animal("Licorne", "🦄"),
    Animal("Pigeon", "🐦"),
  ];
  late Set<Animal> _selection;

  @override
  void initState() {
    super.initState();
    _selection = {_animals[0]};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          children: [
            SegmentedButton<Animal>(
              segments: _animals.map((animal) {
                return ButtonSegment<Animal>(
                  value: animal,
                  label: Text(animal.name),
                  icon: Text(animal.icon),
                );
              }).toList(),
              selected: _selection,
              onSelectionChanged: (newSet) {
                setState(() {
                  _selection = newSet;
                });
              },
            ),
            Expanded(
              child: Center(
                child: Text(
                  "Mon animal préféré est: \n ${_selection.first.icon} ${_selection.first.name}",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
              ),
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
