// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:test_flutter/main.dart';
// import 'package:test_flutter/screens/onboarding_screen.dart';

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_flutter/data/domain/location_domain.dart';
import 'package:test_flutter/data/models/location.dart';
import 'package:test_flutter/data/repository/location_repository.dart';

class MockDio extends Mock implements Dio {}

void main() {
  test('Dio testing', () async {
    final mockDio = MockDio();
    when(
      mockDio.get("https://google.com"),
    ).thenAnswer(
      (invocation) => Future.value(Response()),
    );
  });

  test('Domain & repository testing', () async {
    final mockRepository = LocationRepository();
    final domain = LocationDomain(mockRepository);
    final mockCity = "Bandung";

    final location = Location.fromJson(
      jsonDecode(
        '{"location_suggestions":[{"entity_type": "city","entity_id": 11052,"title": "Bandung","latitude": -6.916055,"longitude": 107.628391,"city_id": 11052,"city_name": "Bandung","country_id": 94,"country_name": "Indonesia"}],"status": "success","has_more": 0,"has_total": 0,"user_has_addresses": true}',
      ),
    );

    expect(await domain.getLocation(mockCity), location);
  });
}
