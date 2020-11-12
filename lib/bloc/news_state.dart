part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
}

class NewsInitial extends NewsState {
  @override
  List<Object> get props => [];
}

class NewsFetchLoading extends NewsState {
  final bool isInitial;
  final List<News> newsList;

  NewsFetchLoading({this.isInitial, this.newsList});

  @override
  List<Object> get props => [isInitial, newsList];
}

class NewsFetchSuccess extends NewsState {
  final List<News> newsList;
  final bool hasReachEnd;

  const NewsFetchSuccess({this.newsList, this.hasReachEnd});
  @override
  List<Object> get props => [newsList];
}

class NewsFetchError extends NewsState {
  final String error;
  final int itemCount;
  final List<News> newsList;

  const NewsFetchError({this.error, this.itemCount, this.newsList});

  @override
  List<Object> get props => [error, itemCount, newsList];
}
