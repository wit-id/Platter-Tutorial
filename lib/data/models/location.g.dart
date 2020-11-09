// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    locationSuggestions: (json['location_suggestions'] as List)
        ?.map((e) => e == null
            ? null
            : LocationSuggestions.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    status: json['status'] as String,
    hasMore: json['has_more'] as int,
    hasTotal: json['has_total'] as int,
    userHasAddresses: json['user_has_addresses'] as bool,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'location_suggestions': instance.locationSuggestions,
      'status': instance.status,
      'has_more': instance.hasMore,
      'has_total': instance.hasTotal,
      'user_has_addresses': instance.userHasAddresses,
    };
