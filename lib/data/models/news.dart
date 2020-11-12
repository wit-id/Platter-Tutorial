import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import "source.dart";

part 'news.g.dart';

@JsonSerializable()
class News extends Equatable  {
	@JsonKey(name: 'source')
	final Source source;
	@JsonKey(name: 'author')
	final String author;
	@JsonKey(name: 'title')
	final String title;
	@JsonKey(name: 'description')
	final String description;
	@JsonKey(name: 'url')
	final String url;
	@JsonKey(name: 'urlToImage')
	final String urlToImage;
	@JsonKey(name: 'publishedAt')
	final String publishedAt;
	@JsonKey(name: 'content')
	final String content;

	News({this.source, this.author, this.title, this.description, this.url, this.urlToImage, this.publishedAt, this.content});

	factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

	Map<String, dynamic> toJson() => _$NewsToJson(this);

	@override
	List<Object> get props => [
		this.source,
		this.author,
		this.title,
		this.description,
		this.url,
		this.urlToImage,
		this.publishedAt,
		this.content
	];
}
