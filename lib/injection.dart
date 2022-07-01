import 'package:get_it/get_it.dart';
import 'package:ny_times/features/most_popular_articles/data/data_source/articles_data_source.dart';
import 'package:ny_times/features/most_popular_articles/data/repository/most_popular_articls_repository_impl.dart';
import 'package:ny_times/features/most_popular_articles/presentation/bloc/most_popular_articles_bloc.dart';

import 'features/most_popular_articles/domain/repository/most_popular_articls_repository.dart';
import 'features/most_popular_articles/domain/use_case/get_articles_use_case.dart';

final serviceLocator = GetIt.instance;

class Injection {
  static Future<void> init() async => _appDependencies();

  static Future<void> _appDependencies() async {
    serviceLocator.registerFactory<MostPopularArticlesBloc>(() {
      return MostPopularArticlesBloc(getArticleUseCase: serviceLocator<GetArticleUseCase>());
    });
    serviceLocator.registerFactory<GetArticleUseCase>(() {
      return GetArticleUseCase(articlesRepo: serviceLocator<MostPopularArticlesRepo>());
    });

    serviceLocator.registerFactory<MostPopularArticlesRepo>(() {
      return MostPopularArticlesRepoImpl(articlesDataSource: serviceLocator());
    });

    serviceLocator.registerFactory<ArticlesDataSource>(() {
      return ArticlesDataSource();
    });
  }
}
