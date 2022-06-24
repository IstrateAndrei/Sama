import 'package:flutter/material.dart';

class HowToPlayScreen extends StatefulWidget {
  const HowToPlayScreen({Key? key}) : super(key: key);

  @override
  State<HowToPlayScreen> createState() => _HowToPlayScreenState();
}

class _HowToPlayScreenState extends State<HowToPlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How to play'),
      ),
      body: Center(
        child: Text('How to play'),
      ),
    );
  }
}
