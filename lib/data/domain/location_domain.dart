import 'package:test_flutter/data/models/location.dart';
import 'package:test_flutter/data/repository/location_repository.dart';

class LocationDomain {
  final LocationRepository locationRepository;

  LocationDomain(this.locationRepository);

  Future<Location> getLocation(String query) {
    return locationRepository.getLocations(query);
  }
}
