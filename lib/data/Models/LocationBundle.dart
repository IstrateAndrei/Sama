import '../../util/LocationGenerator.dart';
import 'Location.dart';

class LocationBundle {
  Locs? bundle;
  List<LocationModel> locations = [];
}

class BundleTile {
  final String title;
  final List<LocationModel> locations;

  const BundleTile({
    required this.title,
    this.locations = const [],
  });
}
