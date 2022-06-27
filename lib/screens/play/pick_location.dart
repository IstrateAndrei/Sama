// ignore_for_file: prefer_const_constructors, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:sama/screens/play/show_location.dart';

import '../../data/Models/Game.dart';

class PickLocationScreen extends StatefulWidget {

  const PickLocationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends State<PickLocationScreen> {
  Locs location = Locs.basic;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final game = ModalRoute.of(context)!.settings.arguments as GameModel;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pick Location'),
      ),
      body: getScreen(context, width, height, game),
    );
  }

  Widget getScreen(BuildContext context, double width, double height, GameModel game) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Basic Locations Bundle (23)'),
          leading: Radio<Locs>(
            value: Locs.basic,
            groupValue: location,
            onChanged: (Locs? value) {
              if (value != null) {
                setState(() {
                  location = value;
                });
              }
            },
          ),
        ),
        ListTile(
          title: const Text('Extra Locations pack (12)'),
          leading: Radio<Locs>(
            value: Locs.extras,
            groupValue: location,
            onChanged: (Locs? value) {
              if (value != null) {
                setState(() {
                  location = value;
                });
              }
            },
          ),
        ),
        SizedBox(
          width: width,
          height: height / 1.5,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5,
            ),
            onPressed: () {

              //pick random location from selected location pack.
              //update the game object with a location and a location Id.
              game.locName = 'Selected Location';
              game.locationId = 12;


              Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ShowLocationScreen();
              },
              settings: RouteSettings(
                arguments: game
              )));
            }, child: Text('Start Game!'))
      ],
    );
  }
}

enum Locs { basic, extras }
