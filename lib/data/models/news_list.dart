import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:test_flutter/data/models/news.dart';

part 'news_list.g.dart';

@JsonSerializable()
class NewsList extends Equatable {
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'totalResults')
  final int totalResults;
  @JsonKey(name: 'articles')
  final List<News> articles;

  NewsList({this.status, this.totalResults, this.articles});

  factory NewsList.fromJson(Map<String, dynamic> json) =>
      _$NewsListFromJson(json);

  Map<String, dynamic> toJson() => _$NewsListToJson(this);

  @override
  List<Object> get props => [
        this.status,
        this.totalResults,
        this.articles,
      ];
}
