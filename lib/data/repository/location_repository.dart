import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_flutter/data/models/location.dart';
import 'package:test_flutter/utils/constants.dart';

class LocationRepository {
  Dio dio = Dio();

  Future<Location> getLocations(String query) async {
    try {
      final response = await dio.get(
        "https://developers.zomato.com/api/v2.1/locations?query=$query",
        options: Options(headers: {"user-key": API_KEY}),
      );
      return Location.fromJson(response.data);
    } catch (e) {
      return e;
    }
  }
}
