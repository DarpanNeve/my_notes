import 'package:flutter/material.dart';
import 'package:my_notes/data/dummy_data.dart';

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
            child: Text(
              notesData[index]["title"]!
            ),),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 5)),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.orangeAccent,
        ),
      ),
    );
  }
}
