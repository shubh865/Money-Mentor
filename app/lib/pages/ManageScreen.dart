import 'package:flutter/material.dart';

class Managescreen extends StatelessWidget {
  const Managescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage'),
      ),
      body: const Center(
        child: Text('Manage Screen'),
      ),
    );
  }
}