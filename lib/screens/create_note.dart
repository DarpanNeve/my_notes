import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateNote extends StatelessWidget {
  CreateNote({super.key});
  final auth=FirebaseAuth.instance.currentUser!.email;
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String content = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Note'),
        actions: [
          IconButton(
            onPressed: ()async {
              _formKey.currentState!.validate();
              if (!_formKey.currentState!.validate()) {
                return;
              }
              _formKey.currentState!.save();
              await FirebaseFirestore.instance.collection(auth!).doc().collection("Notes").doc().set({
                'title':title,
                'content':content,
                'time':DateTime.now(),
              });
              if(context.mounted){
                Navigator.of(context).pop();
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
          key: _formKey,
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
                },
                onSaved: (value){
                  title=value!;
                },
              ),
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
                  },
                  onSaved: (value){
                    content=value!;
                  },
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
