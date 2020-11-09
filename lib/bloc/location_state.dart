part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  // @override
  // List<Object> get props => [];
}

class LocationInitial extends LocationState {
  @override
  List<Object> get props => [];
}

class LocationFetchLoading extends LocationState {
  const LocationFetchLoading();

  @override
  List<Object> get props => [];
}

class LocationFetchSuccess extends LocationState {
  final Location locations;

  const LocationFetchSuccess({this.locations});

  @override
  List<Object> get props => [locations];
}

class LocationFetchError extends LocationState {
  final String error;

  const LocationFetchError({this.error});

  @override
  List<Object> get props => [error];
}
