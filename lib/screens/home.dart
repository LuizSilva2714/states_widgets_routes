import 'package:flutter/material.dart';
import 'package:states_widgets_routes/models/language.dart';
// import 'package:flutter/src/foundation/key.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<Language> languages = [
    // Language("Android Nativo", "Linguagens C, Java, Kotlin"),
    // Language("iOS Nativo", "Objective-C e Swift"),
    // Language("Flutter", "Linguagens Dart"),
    // Language("React Native", "Linguagens JavaScript e TypeScript"),
    // Language("Ionic", "Linguagens JavaScript e TypeScript"),
  ];

  Widget title = const Text("Minhas Linguagens");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
        actions: [
          IconButton(onPressed: _goToAddLanguage, icon: const Icon(Icons.add_circle))
        ],
        ),
      body: Column(
        children: [
          Wrap(
            spacing: 10,
            children: buildChoiceChips(),
          ),
          Expanded(
              child: ListView(
            children: buildItemsList(),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (() {
          _goToAddLanguage();
        }),
        child: const Icon(Icons.add_circle_outline),
      ),
    );
  }

  List<ChoiceChip> buildChoiceChips() {
    return languages
        .map((e) => ChoiceChip(
            label: Text(e.title),
            selected: e.selected,
            onSelected: (value) => setState(() {
                  e.selected = value;
                })))
        .toList();
  }

  List<Widget> buildItemsList() {
    return languages.where((element) => element.selected)
        .map((e) => Card(
              child: ListTile(
                leading: Icon(e.icon),
                title: Text(e.title),
                subtitle: Text(e.subtitle),
                onTap: () {
                  Future future = Navigator.pushNamed(
                  context, 
                  "/add");
                future.then((value) {
                  refresh(value);
                });
                },
              ),
            ))
        .toList();
  }

  _goToAddLanguage(){
    Future future = Navigator.pushNamed(
            context, 
            "/add");
          future.then((value) {
            setState(() {
              languages.add(value);
              
            });
          });
  }

  refresh(Language language){
    setState(() {
    });
  }
}
