import 'package:flutter/material.dart';
import 'package:my_notes/data/dummy_data.dart';

import 'create_note.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text('Notes'),
      ),
      body: GridView.builder(
          itemCount: notesData.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListTile(
            tileColor: Colors.teal,
            title: Text(notesData[index]['title']!),
            subtitle: Text(notesData[index]['content']!),
          ),
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const CreateNote()));
        },
        child: const Icon(
          Icons.add,
          color: Colors.orangeAccent,
        ),
      ),
    );
  }
}
