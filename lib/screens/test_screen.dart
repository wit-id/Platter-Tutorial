import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/bloc/location_bloc.dart';
import 'package:test_flutter/data/domain/location_domain.dart';
import 'package:test_flutter/data/repository/location_repository.dart';

class TestScreen extends StatefulWidget {
  TestScreen({Key key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  LocationDomain _locationDomain;
  LocationBloc _locationBloc;

  @override
  void initState() {
    super.initState();

    _locationDomain = new LocationDomain(LocationRepository());
    _locationBloc = new LocationBloc(locationDomain: _locationDomain);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Where do you want to eat?')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter a location",
              ),
              onChanged: (query) {},
              onSubmitted: (value) {
                _locationBloc.add(LocationFetching(query: value));
              },
              textInputAction: TextInputAction.search,
            ),
          ),
          Expanded(
            child: BlocProvider(
              create: (BuildContext context) {
                return _locationBloc;
              },
              child: BlocListener<LocationBloc, LocationState>(
                listener: (context, state) {
                  if (state is LocationFetchError) {
                    return _buildError(state.error);
                  }
                },
                child: BlocBuilder<LocationBloc, LocationState>(
                  builder: (BuildContext context, LocationState state) {
                    if (state is LocationInitial) {
                      return _buildResults();
                    }
                    if (state is LocationFetchSuccess) {
                      return ListView.builder(
                        itemCount: state.locations.locationSuggestions.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                state.locations.locationSuggestions[index]
                                    .cityName,
                              ),
                            ),
                            subtitle: Text(""),
                          );
                        },
                      );
                    }

                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResults() {
    return Center(child: Text('Enter a location'));
  }

  Widget _buildError(String error) {
    return Center(child: Text(error));
  }
}
