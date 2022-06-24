
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../shared/menu_bottom_nav_bar.dart';

class PlayDetailsScreen extends StatefulWidget {
  const PlayDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PlayDetailsScreen> createState() => _PlayDetailsScreenState();
}

class _PlayDetailsScreenState extends State<PlayDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Details'),
      ),
      body: Center(
        child: Text('Play Details'),
      ),
    );
  }
}
