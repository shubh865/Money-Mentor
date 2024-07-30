import 'package:bob_hacks/constants/sizeconfig.dart';
import 'package:bob_hacks/pages/corpus/ExpenseScreen.dart';
import 'package:bob_hacks/pages/corpus/health_detail.dart';
import 'package:bob_hacks/pages/home.dart';
import 'package:bob_hacks/constants/sizeconfig.dart';
import 'package:bob_hacks/pages/corpus/corpus_predicment.dart.dart';
// import 'package:bob_hacks/pages/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Builder(builder: (context) {
          SizeConfig().init(context); // Initialize SizeConfig here
          return MyHomePage();
        }));
  }
}
