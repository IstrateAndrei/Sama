
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../shared/menu_bottom_nav_bar.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play'),
      ),
      body: Center(
        child: Text('Play'),
      ),
    );
  }
}
