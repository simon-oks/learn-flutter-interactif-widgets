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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
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
            Row(
              children: [
                Text(min.toString()),
                Expanded(
                  child: Slider(
                    min: min,
                    max: max,
                    value: current,
                    onChanged: (nv) {
                      setState(() {
                        current = nv;
                      });
                    },
                    divisions: 5,
                    activeColor: Colors.pink,
                    inactiveColor: Colors.black12,
                  ),
                ),
                Text(max.toString()),
              ],
            ),
            Text("Ma valeur du slider = ${current.toInt()}"),
            Column(
              children: [
                Text("Votre club de Ruby Préféré"),
                Column(
                  children: RugbyClub.values.map((club) {
                    return Row(
                      children: [
                        Text(club.name),
                        Radio(
                          activeColor: Colors.lightGreen,
                          value: club,
                          groupValue: rugbyClub,
                          onChanged: (club) {
                            setState(() {
                              rugbyClub = club;
                            });
                          },
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
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
