import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_flutter/data/models/news_list.dart';
import 'package:test_flutter/utils/constants.dart';

class NewsRepository {
  final Dio dio;

  NewsRepository({@required this.dio});

  Future<NewsList> getTopHeadlines({int page = 1}) async {
    try {
      debugPrint("try");
      final response = await dio.get(
        "/top-headlines",
        queryParameters: {
          "country": "id",
          "apiKey": NEWS_API_KEY,
          "page": "$page",
          "pageSize": 10,
        },
      );
      // debugPrint("repository layer: $response");
      return NewsList.fromJson(response.data);
    } catch (e) {
      debugPrint("repository layer: $e");
      return e;
    }
  }
}
