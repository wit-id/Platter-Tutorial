import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import "location_suggestions.dart";

part 'location.g.dart';

@JsonSerializable()
class Location extends Equatable  {
	@JsonKey(name: 'location_suggestions')
	final List<LocationSuggestions> locationSuggestions;
	@JsonKey(name: 'status')
	final String status;
	@JsonKey(name: 'has_more')
	final int hasMore;
	@JsonKey(name: 'has_total')
	final int hasTotal;
	@JsonKey(name: 'user_has_addresses')
	final bool userHasAddresses;

	Location({this.locationSuggestions, this.status, this.hasMore, this.hasTotal, this.userHasAddresses});

	factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

	Map<String, dynamic> toJson() => _$LocationToJson(this);

	@override
	List<Object> get props => [
		this.locationSuggestions,
		this.status,
		this.hasMore,
		this.hasTotal,
		this.userHasAddresses
	];
}
