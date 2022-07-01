import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times/features/most_popular_articles/domain/use_case/get_articles_use_case.dart';

import '../../domain/use_case/param/param.dart';
import 'most_popular_articles_event.dart';
import 'most_popular_articles_state.dart';

class MostPopularArticlesBloc extends Bloc<MostPopularArticlesEvent, MostPopularArticlesState> {
  final GetArticleUseCase getArticleUseCase;

  MostPopularArticlesBloc({required this.getArticleUseCase}) : super(MostPopularArticlesState()) {
    on<ArticlesFetched>(_onFetchExams);
  }

  _onFetchExams(ArticlesFetched event, Emitter<MostPopularArticlesState> emit) async {
    emit(state.copyWith(
      articlesStatus: ArticlesStatus.loading,
    ));
    final result = await getArticleUseCase(MostPopularParams(period: event.period));
    return result.fold((l) {
      log("error fetching articles");
      emit(state.copyWith(articlesStatus: ArticlesStatus.failure));
    }, (articles) {
      log("Success fetching articles ${articles.length}");

      emit(state.copyWith(articlesStatus: ArticlesStatus.success, articles: articles));
    });
  }
}
