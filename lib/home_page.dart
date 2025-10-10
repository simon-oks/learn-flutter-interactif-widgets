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
  String _simple = "";

  final FocusNode _focus = FocusNode();
  final FocusNode _nextFocus = FocusNode();

  void unfocusMethod1() {
    FocusScope.of(context).unfocus();
  }

  void unfocusMethod2() {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  void unfocusMethod3(FocusNode focusNode) {
    focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: InkWell(
        onTap: () {
          unfocusMethod3(_focus);
        },
        child: Center(
          child: Column(
            children: [
              Text("Valeur de la TextField Simple: $_simple"),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.text,

                      onSubmitted: (submittedString) {
                        setState(() {
                          _simple = submittedString;
                        });
                      },
                      focusNode: _focus,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      FocusScope.of(context).requestFocus(_nextFocus);
                    },
                    icon: Icon(Icons.next_plan),
                  ),
                ],
              ),
              TextField(focusNode: _nextFocus),
            ],
          ),
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
