import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Splash screen',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
