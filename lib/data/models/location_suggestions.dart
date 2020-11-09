import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'location_suggestions.g.dart';

@JsonSerializable()
class LocationSuggestions extends Equatable  {
	@JsonKey(name: 'entity_type')
	final String entityType;
	@JsonKey(name: 'entity_id')
	final int entityId;
	@JsonKey(name: 'title')
	final String title;
	@JsonKey(name: 'latitude')
	final double latitude;
	@JsonKey(name: 'longitude')
	final double longitude;
	@JsonKey(name: 'city_id')
	final int cityId;
	@JsonKey(name: 'city_name')
	final String cityName;
	@JsonKey(name: 'country_id')
	final int countryId;
	@JsonKey(name: 'country_name')
	final String countryName;

	LocationSuggestions({this.entityType, this.entityId, this.title, this.latitude, this.longitude, this.cityId, this.cityName, this.countryId, this.countryName});

	factory LocationSuggestions.fromJson(Map<String, dynamic> json) => _$LocationSuggestionsFromJson(json);

	Map<String, dynamic> toJson() => _$LocationSuggestionsToJson(this);

	@override
	List<Object> get props => [
		this.entityType,
		this.entityId,
		this.title,
		this.latitude,
		this.longitude,
		this.cityId,
		this.cityName,
		this.countryId,
		this.countryName
	];
}
