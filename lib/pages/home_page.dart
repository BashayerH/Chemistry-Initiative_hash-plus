import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, this.title});

  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0; // اكتشف افتراضيًا

  final List<Widget> _pages = const [
  Center(child: Text('Home')),
  Center(child: Text('Search')),
  Center(child: Text('Bookmark')),
  Center(child: Text('Profile')),
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,

      backgroundColor: const Color(0xFFF9F4EA), // OYSTER
      selectedItemColor: const Color(0xFFC47457), // TERRACOTTA
      unselectedItemColor: const Color(0xFF9C9E80), // SAGE

      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },

              items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
