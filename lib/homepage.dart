import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Haybit"),
      ),
      body: ListView(
        children: [
          FilledButton.tonal(
            onPressed: () {},
            child: const Text("Hello"),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.abc),
      ),
    );
  }
}
