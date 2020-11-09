// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_suggestions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationSuggestions _$LocationSuggestionsFromJson(Map<String, dynamic> json) {
  return LocationSuggestions(
    entityType: json['entity_type'] as String,
    entityId: json['entity_id'] as int,
    title: json['title'] as String,
    latitude: (json['latitude'] as num)?.toDouble(),
    longitude: (json['longitude'] as num)?.toDouble(),
    cityId: json['city_id'] as int,
    cityName: json['city_name'] as String,
    countryId: json['country_id'] as int,
    countryName: json['country_name'] as String,
  );
}

Map<String, dynamic> _$LocationSuggestionsToJson(
        LocationSuggestions instance) =>
    <String, dynamic>{
      'entity_type': instance.entityType,
      'entity_id': instance.entityId,
      'title': instance.title,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'city_id': instance.cityId,
      'city_name': instance.cityName,
      'country_id': instance.countryId,
      'country_name': instance.countryName,
    };
