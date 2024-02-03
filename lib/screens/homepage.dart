import 'package:flutter/material.dart';

import 'create_note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsCl_3kAxtuyfdxd7RPEjOHlOGQ0UAwT5MgA&usqp=CAU'),
                        TextFormField(
                          decoration:InputDecoration(
                            label: Text("ID"),
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !value.contains('@')) {
                              return 'Please enter some valid email';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration:const InputDecoration(
                            label: Text("Password"),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length < 7) {
                              return 'Please enter some valid email';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.validate();
                    if(!_formKey.currentState!.validate()){
                      return ;
                    }

                  },
                  child: const Text('submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
