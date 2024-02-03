import 'package:flutter/material.dart';

class CreateNote extends StatelessWidget {
  CreateNote({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Note'),
        actions: [
          IconButton(
            onPressed: () {
              _formKey.currentState!.validate();
              if (!_formKey.currentState!.validate()) {
                return;
              }
              // Start procedure of saving the note
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some valid email';
                    }
                    return null;
                  }),
              Expanded(
                child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Content',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some valid email';
                      }
                      return null;
                    }),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
