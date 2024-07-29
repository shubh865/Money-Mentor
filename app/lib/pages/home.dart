import 'package:flutter/material.dart';
import 'package:bob_hacks/pages/ManageScreen.dart';
import 'package:bob_hacks/pages/EducateScreen.dart';
import 'package:bob_hacks/pages/ExpenseScreen.dart';
import 'package:bob_hacks/pages/help.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController pageController = PageController(initialPage: 0);
  late int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          Managescreen(),
          PayScreen(),
          ExpenseTracker(),
          HelpPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white, // Change background color to white
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black, // Active icon color
        unselectedItemColor: Colors.grey, // Inactive icon color
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            pageController.jumpToPage(index);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: 'manage',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'pay',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Help',
          ),
        ],
      ),
    );
  }
}
