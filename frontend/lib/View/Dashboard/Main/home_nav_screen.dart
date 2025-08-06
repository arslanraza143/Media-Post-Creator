import 'package:flutter/material.dart';
import 'package:frontend/View/Dashboard/Account/account.dart';
import 'package:frontend/View/Dashboard/Main/Components/my_posts.dart';
import 'package:frontend/View/Dashboard/Post/post.dart';
import 'package:frontend/View/Dashboard/Setting/setting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Home(),
    Post(),
    Setting(),
    Account(),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'POST'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'SETTING'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'ACCOUNT'),
        ],
      ),
    );
  }

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
