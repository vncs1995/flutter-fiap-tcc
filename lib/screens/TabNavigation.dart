import 'package:flutter/material.dart';
import 'package:pokedex/screens/Home.dart';
import 'package:pokedex/screens/MyPokedex.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  int _currentIndex = 0;
  final tabs = [
    HomeScreen(),
    MyPokedexScreen()
  ];
  @override
  Widget build(context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Encontrar"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Minha Pokedex")
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },),
    );
  }
}
