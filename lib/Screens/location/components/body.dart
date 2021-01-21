import 'package:flutter/material.dart';
import 'package:test_flutter/Screens/location/components/background.dart';
import 'package:test_flutter/blocs/bloc_provider.dart';
import 'package:test_flutter/blocs/location_bloc/location_bloc.dart';
import 'package:test_flutter/blocs/location_bloc/location_query_bloc.dart';
import 'package:test_flutter/repositories/location.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = LocationQueryBloc();
    return BlocProvider<LocationQueryBloc>(
      bloc: bloc,
      child: Background(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter a location'),
                onChanged: (query) {},
              ),
            ),
            Expanded(
              child: _buildResults(bloc),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildResults(LocationQueryBloc bloc) {
    return StreamBuilder<List<Location>>(
      stream: bloc.locationStream,
      builder: (context, snapshot) {

        // 1
        final results = snapshot.data;

        if (results == null) {
          return Center(child: Text('Enter a location'));
        }

        if (results.isEmpty) {
          return Center(child: Text('No Results'));
        }

        return _buildSearchResults(results);
      },
    );
  }

  Widget _buildSearchResults(List<Location> results) {
    // 2
    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (context, index) {
        final location = results[index];
        return ListTile(
          title: Text(location.title),
          onTap: () {
            final locationBloc = BlocProvider.of<LocationBloc>(context);
            locationBloc.selectLocation(location);

            if (isFullScreenDialog) {
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }
}
