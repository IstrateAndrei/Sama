// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sama/screens/play/HowToPlay.dart';
import 'package:sama/screens/play/NewGameSettings.dart';

import '../shared/Extensions.dart';
import '../util/Utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  //animation
  late AnimationController _animationController;

  //maybe need later for the buttons
  late Animation _colorAnimation;
  late Animation<double> _scaleAnimation;
  bool _isFirstRoundFinished = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _colorAnimation =
        ColorTween(begin: Color(0xFF665544), end: Color(0xFF445599))
            .animate(_animationController);

    _scaleAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween(begin: 0, end: 300), weight: 50),
      // TweenSequenceItem(tween: Tween(begin: 100, end: 70), weight: 50),
    ]).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCirc));

    _animationController.addListener(() {
      if (_scaleAnimation.value == 300 && !_isFirstRoundFinished) {
        //show the buttons
        _isFirstRoundFinished = true;
        _animationController.reset();
        _animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //screen size variables
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: getTitleTextStyle(),
        ),
        actions: [getSettingsButton(context)],
      ),
      body: Center(
        child: Container(
          width: width,
          height: height,
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(color: Colors.white),
          child: getScreen(context, width, height),
        ),
      ),
    );
  }

  Widget getScreen(BuildContext context, double width, double height) {
    Widget logo2 = TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.0, end: 300.0),
        duration: Duration(milliseconds: 2000),
        curve: Curves.easeInOutCirc,
        builder: (BuildContext c, double _val, _) {
          if (_val == 300) {
            _animationController.forward();
          }
          return Image(
            width: _val,
            height: _val,
            image: AssetImage('assets/logo_15fps.gif'),
          );
        });

    Widget titleImage = AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, _) {
        return Container(
          height: _isFirstRoundFinished ? 100 : _scaleAnimation.value / 3,
          width: _isFirstRoundFinished ? 300 : _scaleAnimation.value,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/sama_full.png'))),
        );
      },
    );

    AnimatedBuilder newGameButton = AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          if (_isFirstRoundFinished) {
            return SizedBox(
              height: _isFirstRoundFinished ? _scaleAnimation.value / 8 : 0,
              width: _isFirstRoundFinished ? _scaleAnimation.value : 0,
              child: ElevatedButton(
                style: getElevatedButtonStyle(),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return NewGameSettingsScreen();
                  }));
                },
                child: getElevationButtonChild('New Game'),
              ),
            );
          } else {
            return SizedBox(
              height: 10,
            );
          }
        });

    AnimatedBuilder howToPlayButton = AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return SizedBox(
            height: _isFirstRoundFinished ? _scaleAnimation.value / 8 : 0,
            width: _isFirstRoundFinished ? _scaleAnimation.value : 0,
            child: ElevatedButton(
              style: getElevatedButtonStyle(),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HowToPlayScreen();
                }));
              },
              child: getElevationButtonChild('How to Play?'),
            ),
          );
        });

    return Column(
      children: [
        titleImage,
        logo2,
        SizedBox(
          height: height / 6,
        ),
        newGameButton,
        SizedBox(
          height: 15,
        ),
        howToPlayButton,
      ],
    );
  }
}
