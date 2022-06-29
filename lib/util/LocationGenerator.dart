import 'dart:math';

import 'package:sama/data/Models/Location.dart';
import '../screens/play/PickLocation.dart';

enum Locs { basic, extras }

LocationModel getRandomLocation(Locs bundleId) {
  switch (bundleId) {
    case Locs.basic:
      return getRandomElement(getBasicLocations());
    case Locs.extras:
      return getRandomElement(getExtraLocations());
    default:
      return getRandomElement(getBasicLocations());
  }
}


List<LocationModel> getLocations(Locs bundleId) {
  switch (bundleId) {
    case Locs.basic:
      return getBasicLocations();
    case Locs.extras:
      return getExtraLocations();
    default:
      return getBasicLocations();
  }
}

List<LocationModel> getBasicLocations() {
  List<LocationModel> list = [];

  LocationModel item1 = LocationModel();
  item1.bundleId = Locs.basic;
  item1.locationId = 1;
  item1.locationName = 'Airplane';
  item1.roles = ['Pilot', 'Co-pilot','Stewardess','Passenger','Passenger', 'Steward' ];
  list.add(item1);

  LocationModel item2 = LocationModel();
  item2.bundleId = Locs.basic;
  item2.locationId = 2;
  item2.locationName = 'Hospital';
  item2.roles = ['Doctor', 'Nurse','Receptionist','Patient','Visitor', 'Patient' ];
  list.add(item2);

  LocationModel item3 = LocationModel();
  item3.bundleId = Locs.basic;
  item3.locationId = 2;
  item3.locationName = 'Train';
  item3.roles = ['Conductor', 'Passenger','Nasu','Freeloader','Inspector', 'Passenger' ];
  list.add(item3);

  LocationModel item4 = LocationModel();
  item4.bundleId = Locs.basic;
  item4.locationId = 2;
  item4.locationName = 'Circus';
  item4.roles = ['Acrobat', 'Showman','Clown','Elephant','Midget', 'Spectator' ];
  list.add(item4);

  return list;
}


List<LocationModel> getExtraLocations() {
  List<LocationModel> list = [];
  return list;
}

T getRandomElement<T>(List<T> list){
  final random = Random();
  var i = random.nextInt(list.length);
  return list[i];
}
