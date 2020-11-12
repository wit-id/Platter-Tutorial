import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'source.g.dart';

@JsonSerializable()
class Source extends Equatable {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;

  Source({this.id, this.name});

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);

  @override
  List<Object> get props => [this.id, this.name];
}
