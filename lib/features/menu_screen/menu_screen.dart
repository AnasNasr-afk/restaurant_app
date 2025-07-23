import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Menu Screen!',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action when the button is pressed
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Floating Action Button Pressed')),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
