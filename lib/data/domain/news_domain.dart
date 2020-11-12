import 'package:test_flutter/data/models/news_list.dart';
import 'package:test_flutter/data/repository/news_repository.dart';

class NewsDomain {
  final NewsRepository newsRepository;

  NewsDomain(this.newsRepository);

  Future<NewsList> getTopHeadlines({int page = 1}) {
    return newsRepository.getTopHeadlines(page: page);
  }
}
