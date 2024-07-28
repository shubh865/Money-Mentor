import 'package:flutter/material.dart';

class Payscreen extends StatelessWidget {
  const Payscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay'),
      ),
      body: const Center(
        child: Text('Pay Screen'),
      ),
    );
  }
}