// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(8.0),
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'Players',
      'Guidelines',
      'Settings'
    ];

    List<Widget> menuItems = [];
    menuItems.add(DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent
      ),
        child: Center(
          child: Text(
            'Sama la ala',
            style: TextStyle(
                color: Colors.white, fontSize: 24, fontFamily: 'baby'),
          ),
        )));

    menuTitles.forEach((element) {
      menuItems.add(ListTile(
        title: Text(element, style: TextStyle(
            fontSize: 18
        ),), onTap: () {},

      ));
    });
    return menuItems;
  }
}
