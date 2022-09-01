import 'package:flutter/material.dart';
import 'package:states_widgets_routes/models/language.dart';

class AddLanguage extends StatelessWidget {
  AddLanguage({Key? key}) : super(key: key);
  static const routeName = "/add";
  final Text title = const Text("Nova Linguagem");
  final EdgeInsets padding = const EdgeInsets.all(16);
  
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
      ),
      body: Padding(
        padding: padding,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Nome da Linguagem",
                  labelText: "Nome da Linguagem"
                ),
                controller: _nameController,
                validator: (value) {
                  if(value!.isEmpty){
                    return "Insira o nome da Linguagem";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Detalhes da Linguagem",
                  labelText: "Detalhes da Linguagem"
                ),
                controller: _detailController,
                validator: ((value) {
                  if(value!.isEmpty){
                    return "Insira os detalhes da Linguagem";
                  }
                  return null;
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  child: const Text("Gravar"),
                  onPressed: () {
                    if(_formKey.currentState!.validate()){
                      Language language = Language(_nameController.text, _detailController.text);
                      Navigator.pop(context, language);
                    }
                    
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}