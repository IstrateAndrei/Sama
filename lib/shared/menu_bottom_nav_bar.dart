// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sama/screens/Home.dart';
import 'package:sama/screens/play/NewGameSettings.dart';
import 'package:sama/screens/Settings.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  static int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.orange[500],
      currentIndex: _currentIndex,
      items: getItems(),
      onTap: (value) {
        _onItemTapped(context, value);
      },
    );
  }

  List<BottomNavigationBarItem> getItems() {
    List<BottomNavigationBarItem> items = [];
    //home button
    // items.add(BottomNavigationBarItem(
    //   icon: const Icon(Icons.home_outlined),
    //   label: 'Home',
    //   // activeIcon: Icon(Icons.home_sharp)
    // ));

    //play button
    items.add(BottomNavigationBarItem(
      icon: const Icon(Icons.play_circle_outline),
      label: 'Play',
      // activeIcon: Icon(Icons.play_circle)
    ));

    items.add(BottomNavigationBarItem(
      icon: const Icon(Icons.settings_outlined),
      label: 'Settings',
      // activeIcon: Icon(Icons.settings)
    ));

    return items;
  }

  void _onItemTapped(BuildContext context, int index) {
    setState(() {
      _currentIndex = index;
    });
    changeRoute(context, index);
  }

  void changeRoute(BuildContext context, int menuItemIndex) {
    if (Navigator.canPop(context)) Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      switch (menuItemIndex) {
        case 0:
          return NewGameSettingsScreen();
        case 1:
          return SettingsScreen();

        default:
          return HomeScreen();
      }
    }));
  }
}
