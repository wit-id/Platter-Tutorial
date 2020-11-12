import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_flutter/data/domain/news_domain.dart';
import 'package:test_flutter/data/models/news.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsDomain newsDomain;
  var page = 1;
  var maxPage = 1;

  bool isFetching = false;

  List<News> newsList = List<News>();

  NewsBloc({@required this.newsDomain})
      : assert(newsDomain != null),
        super(NewsInitial());

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is NewsFetching) {
      try {
        if (maxPage >= page) {
          yield NewsFetchLoading(isInitial: page == 1, newsList: newsList);
          var news = await newsDomain.getTopHeadlines(page: page);
          newsList.addAll(news.articles);
          maxPage = news.totalResults ~/ 10;
          yield NewsFetchSuccess(newsList: newsList, hasReachEnd: false);
          page++;
          isFetching = false;
        } else {
          yield NewsFetchSuccess(newsList: newsList, hasReachEnd: true);
        }
      } catch (e) {
        yield NewsFetchError(
          error: e.toString(),
          itemCount: 0,
          newsList: newsList,
        );
      }
    }
  }
}
