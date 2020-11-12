import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_flutter/data/domain/location_domain.dart';
import 'package:test_flutter/data/models/location.dart';
import 'package:test_flutter/data/models/location_suggestions.dart';
import 'package:meta/meta.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationDomain locationDomain;

  LocationSuggestions _location;
  LocationSuggestions get selectedLocation => _location;

  final _locationController = StreamController<LocationSuggestions>();

  Stream<LocationSuggestions> get locationStream => _locationController.stream;

  LocationBloc({@required this.locationDomain})
      : assert(locationDomain != null),
        super(LocationInitial());

  @override
  LocationState get initialState => LocationInitial();

  @override
  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    if (event is LocationFetching) {
      yield LocationFetchLoading();
      try {
        Location location = await locationDomain.getLocation(event.query);
        yield LocationFetchSuccess(locations: location);
      } catch (e) {
        // debugPrint(e.toString());
        yield LocationFetchError(error: e.toString());
      }
    }
  }

  void selectLocation(LocationSuggestions location) {
    _location = location;
    _locationController.sink.add(location);
  }
}
