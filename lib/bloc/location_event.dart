part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class LocationFetching extends LocationEvent {
  final String query;

  const LocationFetching({this.query});
}
