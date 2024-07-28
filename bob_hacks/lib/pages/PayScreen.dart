import 'package:bob_hacks/constants/sizeconfig.dart';
import 'package:flutter/material.dart';

class Payscreen extends StatelessWidget {
  const Payscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay'),
      ),
      body: Center(
        child: Container(
            height: SizeConfig.getPercentSize(4),
            width: SizeConfig.getPercentSize(3),
            child: Text('Pay Screen')),
      ),
    );
  }
}
