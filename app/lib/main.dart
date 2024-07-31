import 'package:bob_hacks/constants/sizeconfig.dart';
import 'package:bob_hacks/data/model/add_date.dart';
import 'package:bob_hacks/pages/corpus/ExpenseScreen.dart';
import 'package:bob_hacks/pages/corpus/health_detail.dart';
import 'package:bob_hacks/pages/home.dart';
import 'package:bob_hacks/constants/sizeconfig.dart';
import 'package:bob_hacks/pages/corpus/corpus_predicment.dart.dart';
import 'package:bob_hacks/profile_screen.dart';
// import 'package:bob_hacks/pages/test.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(AdddataAdapter());
  await Hive.openBox<Add_data>('data');
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
          return ProfileScreen();
        }));
  }
}
