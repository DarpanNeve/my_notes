import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "data",
          style: TextStyle(
            fontSize: 40,
            color: Colors.deepPurple,
          ),
        ),
      ),
    );
  }
}
