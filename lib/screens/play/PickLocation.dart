// ignore_for_file: prefer_const_constructors, no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:sama/data/Models/LocationBundle.dart';
import 'package:sama/screens/play/RoleDisplay.dart';
import 'package:sama/util/Utils.dart';

import '../../data/Models/Game.dart';
import '../../util/LocationGenerator.dart';

class PickLocationScreen extends StatefulWidget {
  const PickLocationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PickLocationScreenState();
}

class _PickLocationScreenState extends State<PickLocationScreen> {
  Locs bundle = Locs.basic;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    final game = ModalRoute.of(context)!.settings.arguments as GameModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pick Location',
          style: getTitleTextStyle(),
        ),
      ),
      body: getScreen(context, width, height, game),
    );
  }

  Widget getScreen(
      BuildContext context, double width, double height, GameModel game) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            'Basic Locations Bundle (${getBasicLocations().length})',
            style: getMessageTextStyle(),
          ),
          leading: Radio<Locs>(
            value: Locs.basic,
            groupValue: bundle,
            onChanged: (Locs? value) {
              if (value != null) {
                setState(() {
                  bundle = value;
                });
              }
            },
          ),
        ),
        ListTile(
          title: Text(
            'Extra Locations pack (${getExtraLocations().length})',
            style: getMessageTextStyle(),
          ),
          leading: Radio<Locs>(
            value: Locs.extras,
            groupValue: bundle,
            onChanged: (Locs? value) {
              if (value != null) {
                setState(() {
                  bundle = value;
                });
              }
            },
          ),
        ),
        SizedBox(
          width: width,
          height: height / 1.6,
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 5,
            ),
            onPressed: () {
              //pick random location from selected location pack.
              //update the game object with a location and a location Id.
              LocationBundle locBundle = LocationBundle();
              locBundle.bundle = bundle;
              locBundle.locations = getLocations(bundle);

              game.locBundle = locBundle;

              game.location = getRandomLocation(bundle);

              //handle player, spy, and time values

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) {
                        return RoleDisplayScreen();
                      },
                      settings: RouteSettings(arguments: game)));
            },
            child: getElevationButtonChild("Start Game!"))
      ],
    );
  }
}
