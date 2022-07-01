import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:ny_times/core/error/failures.dart';
import 'package:ny_times/features/most_popular_articles/data/models/article.dart';
import 'package:ny_times/features/most_popular_articles/domain/use_case/get_articles_use_case.dart';
import 'package:ny_times/features/most_popular_articles/domain/use_case/param/param.dart';
import 'package:ny_times/features/most_popular_articles/presentation/bloc/most_popular_articles_bloc.dart';
import 'package:ny_times/features/most_popular_articles/presentation/bloc/most_popular_articles_event.dart';
import 'package:ny_times/features/most_popular_articles/presentation/bloc/most_popular_articles_state.dart';

import 'most_popular_articles_bloc_test.mocks.dart';

@GenerateMocks([GetArticleUseCase])
void main() {
  late MostPopularArticlesBloc mostPopularArticlesBloc;
  late MockGetArticleUseCase mockGetArticlesUseCase;
  setUp(() {
    mockGetArticlesUseCase = MockGetArticleUseCase();
    mostPopularArticlesBloc = MostPopularArticlesBloc(getArticleUseCase: mockGetArticlesUseCase);
  });
  tearDown(() {
    mostPopularArticlesBloc.close();
  });

  group('articles bloc test', () {
    List<ArticleModel> articlesData = [];
    final expectedSuccessResponse = [
      MostPopularArticlesState(articlesStatus: ArticlesStatus.loading),
      MostPopularArticlesState(articlesStatus: ArticlesStatus.success, articles: articlesData),
    ];
    final expectedFailureResponse = [
      MostPopularArticlesState(articlesStatus: ArticlesStatus.loading),
      MostPopularArticlesState(articlesStatus: ArticlesStatus.failure)
    ];
    blocTest('should emit [Loading, success] when [ArticlesFetched] is called',
        build: () => mostPopularArticlesBloc,
        act: (MostPopularArticlesBloc bloc) =>
            bloc.add(ArticlesFetched(period: ArticlesPeriod.daily)),
        expect: () => expectedSuccessResponse,
        setUp: () {
          when(mockGetArticlesUseCase(any))
              .thenAnswer((realInvocation) async => Future.value(Right(articlesData)));
        },
        verify: (_) => verify(mockGetArticlesUseCase(any)).called(1));

    blocTest('should emit [Loading, failure] when [ArticlesFetched] is called',
        build: () => mostPopularArticlesBloc,
        act: (MostPopularArticlesBloc bloc) =>
            bloc.add(ArticlesFetched(period: ArticlesPeriod.daily)),
        expect: () => expectedFailureResponse,
        setUp: () {
          when(mockGetArticlesUseCase(any))
              .thenAnswer((realInvocation) async => Future.value(left(ServerFailure())));
        },
        verify: (_) => verify(mockGetArticlesUseCase(any)).called(1));
  });
}
