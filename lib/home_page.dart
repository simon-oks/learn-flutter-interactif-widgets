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
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _controller;

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
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
          unfocusMethod1();
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Text("Valeur de la TextField Simple: $_simple"),
                TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,

                  onSubmitted: (submittedString) {
                    setState(() {
                      _simple = submittedString;
                    });
                  },
                  focusNode: _focus,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        FocusScope.of(context).requestFocus(_nextFocus);
                      },
                      icon: Icon(Icons.next_plan),
                    ),
                    suffixIconColor: Colors.pink,
                  ),
                ),
                SizedBox(height: 24),
                TextField(
                  focusNode: _nextFocus,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    icon: Icon(Icons.person),
                    label: Text("Nom de famille"),
                    hintText: "Entrez votre nom",
                  ),
                ),
                SizedBox(height: 24),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText:
                        "Voyons si vous arrivez à me lire en appuyant sur le button",
                  ),
                ),
                SizedBox(height: 24),
                ElevatedButton(
                  onPressed: (() => setState(() {
                    unfocusMethod2();
                  })),
                  child: Text("Révèle le texte"),
                ),
                Text(_controller.text),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "L'adresse mail ne peut pas être vide";
                          } else {
                            null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Entrez votre adresse mail",
                          label: Text("Adresse mail"),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            unfocusMethod2();
                          } else {
                            print("Nope");
                          }
                        },
                        child: Text("Valider"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
