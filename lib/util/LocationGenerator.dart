import 'dart:math';

import 'package:sama/data/Models/Location.dart';
import '../data/Models/Role.dart';
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
  item1.roles = [
    Role(title: 'Pilot', isUnique: true),
    Role(title: 'Air marshal', isUnique: true),
    Role(title: 'Passenger', isUnique: false),
    Role(title: 'Old friendly babushka', isUnique: true),
    Role(title: 'Flight attendant', isUnique: false),
  ];
  list.add(item1);

  LocationModel item2 = LocationModel();
  item2.bundleId = Locs.basic;
  item2.locationId = 2;
  item2.locationName = 'Hospital';
  item2.roles = [
    Role(title: 'Doctor', isUnique: false),
    Role(title: 'Nurse', isUnique: false),
    Role(title: 'Receptionist', isUnique: true),
    Role(title: 'Patient', isUnique: false),
    Role(title: 'Visitor', isUnique: false),
  ];
  list.add(item2);

  LocationModel item3 = LocationModel();
  item3.bundleId = Locs.basic;
  item3.locationId = 3;
  item3.locationName = 'Train';
  item3.roles = [
    Role(title: 'Train operator', isUnique: true),
    Role(title: 'Traveller', isUnique: false),
    Role(title: 'Tourist', isUnique: false),
    Role(title: 'Freeloader', isUnique: true),
    Role(title: 'Inspector', isUnique: true),
    Role(title: 'Snacks vendor', isUnique: true),
    Role(title: 'Commuter', isUnique: true),
  ];
  list.add(item3);

  LocationModel item4 = LocationModel();
  item4.bundleId = Locs.basic;
  item4.locationId = 4;
  item4.locationName = 'Circus';
  item4.roles = [
    Role(title: 'Spectator', isUnique: false),
    Role(title: 'Clown', isUnique: false),
    Role(title: 'Acrobat', isUnique: false),
    Role(title: 'Fortune teller', isUnique: true),
    Role(title: 'Midget', isUnique: true),
    Role(title: 'Circus Ringmaster', isUnique: true),
    Role(title: 'Animal trainer', isUnique: true),
  ];
  list.add(item4);

  LocationModel item5 = LocationModel();
  item5.bundleId = Locs.basic;
  item5.locationId = 5;
  item5.locationName = 'Theater';
  item5.roles = [
    Role(title: 'Actor', isUnique: false),
    Role(title: 'Musician', isUnique: false),
    Role(title: 'Makeup artist', isUnique: true),
    Role(title: 'Janitor', isUnique: true),
    Role(title: 'Technician', isUnique: true),
    Role(title: 'Spectator', isUnique: false),
  ];
  list.add(item5);

  LocationModel item6 = LocationModel();
  item6.bundleId = Locs.basic;
  item6.locationId = 6;
  item6.locationName = 'Beach';
  item6.roles = [
    Role(title: 'Tourist', isUnique: false),
    Role(title: 'Surfer', isUnique: false),
    Role(title: 'Metal detector guy', isUnique: true),
    Role(title: 'Volleyball player', isUnique: false),
    Role(title: 'Lifeguard', isUnique: true),
    Role(title: 'Snorkeler', isUnique: false),
    Role(title: 'Beach vendor', isUnique: true),
  ];
  list.add(item6);

  LocationModel item7 = LocationModel();
  item7.bundleId = Locs.basic;
  item7.locationId = 7;
  item7.locationName = 'Bank';
  item7.roles = [
    Role(title: 'Security guard', isUnique: false),
    Role(title: 'Customer', isUnique: false),
    Role(title: 'Bank teller', isUnique: true),
    Role(title: 'Robber', isUnique: true),
    Role(title: 'Janitor', isUnique: true),
  ];
  list.add(item7);

  LocationModel item8 = LocationModel();
  item8.bundleId = Locs.basic;
  item8.locationId = 8;
  item8.locationName = 'University';
  item8.roles = [
    Role(title: 'Professor', isUnique: false),
    Role(title: 'Tutor', isUnique: false),
    Role(title: 'Student', isUnique: false),
    Role(title: 'Dean', isUnique: true),
    Role(title: 'Janitor', isUnique: true),
  ];
  list.add(item8);

  LocationModel item9 = LocationModel();
  item9.bundleId = Locs.basic;
  item9.locationId = 9;
  item9.locationName = 'School';
  item9.roles = [
    Role(title: 'Professor', isUnique: false),
    Role(title: 'Teacher', isUnique: false),
    Role(title: 'Student', isUnique: false),
    Role(title: 'Parent', isUnique: false),
    Role(title: 'Principal', isUnique: true),
    Role(title: 'Janitor', isUnique: true),
  ];
  list.add(item9);

  LocationModel item10 = LocationModel();
  item10.bundleId = Locs.basic;
  item10.locationId = 10;
  item10.locationName = 'Pirate Ship';
  item10.roles = [
    Role(title: 'Cannoneer', isUnique: false),
    Role(title: 'One eyed pirate', isUnique: true),
    Role(title: 'Prisoner', isUnique: false),
    Role(title: 'Pirate', isUnique: false),
    Role(title: 'One legged pirate', isUnique: true),
    Role(title: 'Captain', isUnique: true),
  ];
  list.add(item10);

  return list;
}

List<LocationModel> getExtraLocations() {
  List<LocationModel> list = [];
  return list;
}

T getRandomElement<T>(List<T> list) {
  final random = Random();
  var i = random.nextInt(list.length);
  return list[i];
}
