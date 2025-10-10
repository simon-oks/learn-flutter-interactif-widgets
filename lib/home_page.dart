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
  List<User> users = [
    User("Gérard", Colors.brown),
    User("Marie", Colors.purple),
    User("Stéphane", Colors.blue),
    User("Johnny", Colors.red),
    User("Sylvie", Colors.lightGreenAccent),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Wrap(
          children: users.map((user) {
            return Chip(
              label: Text(user.name),
              avatar: CircleAvatar(
                backgroundColor: user.color,
                child: Text(user.name[0]),
              ),
              onDeleted: () {
                setState(() {
                  users.remove(user);
                });
              },
            );
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

class User {
  String name;
  Color color;

  User(this.name, this.color);
}
