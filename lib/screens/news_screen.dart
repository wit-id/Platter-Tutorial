import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_flutter/bloc/news_bloc.dart';
import 'package:test_flutter/data/domain/news_domain.dart';
import 'package:test_flutter/data/repository/news_repository.dart';
import 'package:test_flutter/utils/dio_client.dart';

class NewsScreen extends StatefulWidget {
  NewsScreen({Key key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  NewsDomain _newsDomain;
  NewsBloc _newsBloc;

  var page = 1;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _newsDomain = new NewsDomain(NewsRepository(dio: DioClient().dio));
    _newsBloc = new NewsBloc(newsDomain: _newsDomain);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Warta : News')),
      body: Column(
        children: [
          Expanded(
            child: BlocProvider(
              create: (BuildContext context) {
                return _newsBloc
                  ..isFetching = true
                  ..add(NewsFetching(page: page));
              },
              child: BlocListener<NewsBloc, NewsState>(
                listener: (context, state) {},
                child: BlocBuilder<NewsBloc, NewsState>(
                  builder: (BuildContext context, NewsState state) {
                    if (state is NewsInitial) {
                      return _buildResults();
                    }
                    if (state is NewsFetchError) {
                      if (state.itemCount > 0 && state.newsList.length > 0) {
                        return Column(
                          children: [
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: state.newsList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      state.newsList[index].title,
                                    ),
                                  ),
                                );
                              },
                            ),
                            // Center(
                            //   child: Text("End of list"),
                            // ),
                          ],
                        );
                      }
                      return _buildError(state.error);
                    }
                    if (state is NewsFetchLoading && !state.isInitial) {
                      return ListView.builder(
                        controller: _scrollController
                          ..addListener(() {
                            final maxScroll =
                                _scrollController.position.maxScrollExtent;
                            final currentScroll =
                                _scrollController.position.pixels;
                            if (maxScroll - currentScroll <= 200.0) {
                              if (_newsBloc.isFetching == false) {
                                _newsBloc
                                  ..isFetching = true
                                  ..add(NewsFetching(page: page));
                              }
                            }
                          }),
                        itemCount: state.newsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                state.newsList[index].title,
                              ),
                            ),
                            subtitle: Text(""),
                          );
                        },
                      );
                    }
                    if (state is NewsFetchSuccess) {
                      return ListView.builder(
                        controller: _scrollController
                          ..addListener(() {
                            final maxScroll =
                                _scrollController.position.maxScrollExtent;
                            final currentScroll =
                                _scrollController.position.pixels;
                            if (maxScroll - currentScroll <= 200.0) {
                              if (_newsBloc.isFetching == false &&
                                  state.hasReachEnd == false) {
                                _newsBloc
                                  ..isFetching = true
                                  ..add(NewsFetching(page: page));
                              }
                            }
                          }),
                        itemCount: state.newsList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                state.newsList[index].title,
                              ),
                            ),
                            subtitle: Text(""),
                          );
                        },
                      );
                    }

                    if (state is NewsFetchLoading) {
                      if (state.isInitial) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResults() {
    return Center(child: Text('Empty data'));
  }

  Widget _buildError(String error) {
    return Center(child: Text(error));
  }
}
