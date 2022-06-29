
import 'package:sama/data/Models/Location.dart';
import 'package:sama/data/Models/LocationBundle.dart';

import '../../screens/play/PickLocation.dart';

class GameModel {
  int playerCount = 0;
  int spyCount = 0;
  int timeCount = 0;
  LocationModel? location;
  LocationBundle? locBundle;
  bool isShitShow = false;

  GameModel();
}