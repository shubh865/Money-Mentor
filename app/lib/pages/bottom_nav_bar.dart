import 'package:bob_hacks/constants/sizeconfig.dart';
import 'package:flutter/material.dart';

class Bottomnavbar extends StatefulWidget {
  @override
  _BottomnavbarState createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.manage_accounts),
          label: 'manage',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.book),
          label: 'Educate',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'shop',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help),
          label: 'help',
        ),
      ],
    );
  }
}
