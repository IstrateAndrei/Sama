// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:sama/data/Models/Game.dart';
import 'package:sama/screens/main/Home.dart';
import 'package:sama/util/Utils.dart';

class ConclusionScreen extends StatefulWidget {
  const ConclusionScreen({Key? key}) : super(key: key);

  @override
  State<ConclusionScreen> createState() => _ConclusionScreenState();
}

class _ConclusionScreenState extends State<ConclusionScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    GameModel gameModel =
        ModalRoute.of(context)!.settings.arguments as GameModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Conclusion',
          style: getTitleTextStyle(),
        ),
      ),
      body: Center(
        child: Container(
          child: getScreen(context, width, height, gameModel),
        ),
      ),
    );
  }

  Column getScreen(
      BuildContext context, double width, double height, GameModel gameModel) {
    var spiesQuestion = Text(
      gameModel.spyCount == 1 ? 'Who is the spy?' : 'Who are the spies?',
      style: getSubtitleTextStyle(),
      textAlign: TextAlign.center,
    );
    var locationQuestion = Text(
      'For the ${gameModel.spyCount == 1 ? 'spy' : 'spies'}:\nWhere is the location?',
      style: getSubtitleTextStyle(),
      textAlign: TextAlign.center,
    );

    Widget logo = TweenAnimationBuilder(
        tween: Tween<double>(begin: 0.0, end: 250.0),
        duration: Duration(milliseconds: 800),
        curve: Curves.easeInOutCirc,
        builder: (BuildContext c, double _val, _) {
          return Image(
            width: _val,
            height: _val,
            image: AssetImage('assets/logo_15fps.gif'),
          );
        });

    Widget backToHomeBtn = ElevatedButton(
        style: getElevatedButtonStyle(),
        onPressed: () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (context) {
              return HomeScreen();
            },
          ), (Route<dynamic> route) => false);
        },
        child: Container(
            padding: EdgeInsets.all(8.0),
            child: getElevationButtonChild('Back to home')));

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [spiesQuestion, logo, locationQuestion, backToHomeBtn],
    );
  }
}
