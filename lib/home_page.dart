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
  double min = 0;
  double max = 100;
  double current = 33;
  RugbyClub? rugbyClub;

  Map<String, bool> groceries = {
    "Banane": false,
    "Oeufs": false,
    "Pates": false,
    "Beurre": false,
    "Poulet": false,
    "Mayonnaise": false,
    "Quinoa": false,
    "Céréales": false,
    "Café": false,
    "Ail": false,
    "Persil": false,
    "Courgettes": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: isOn ? Colors.white : Colors.black45,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groceries.keys.map((key) {
            return CheckboxListTile(
              title: Text(key),
              subtitle: Text(groceries[key]! ? "Dans le panier" : "A acheter"),
              value: groceries[key],
              onChanged: (newBool) {
                setState(() {
                  groceries[key] = newBool ?? false;
                });
              },
            );

            // Row(
            // children: [
            //   Text(key),
            //   Checkbox(
            //     value: groceries[key],
            //     onChanged: (newBool) {
            //       setState(() {
            //         groceries[key] = newBool ?? false;
            //       });
            //     },
            //   ),
            // ],
            // );
          }).toList(),
        ),
      ),
    );
  }
}

enum RugbyClub { Toulon, Toulouse, Biarritiz, Racing, Clermon }

class Animal {
  String name;
  String icon;

  Animal(this.name, this.icon);
}
