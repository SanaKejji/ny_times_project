import 'package:dartz/dartz.dart';
import 'package:ny_times/features/most_popular_articles/data/models/article.dart';
import '../../../../../../../core/error/failures.dart';
import '../../../../core/unified_api/handling_exception.dart';
import '../../domain/repository/most_popular_articls_repository.dart';
import '../data_source/articles_data_source.dart';

class MostPopularArticlesRepoImpl extends MostPopularArticlesRepo {
  ArticlesDataSource articlesDataSource;

  MostPopularArticlesRepoImpl({required this.articlesDataSource});

  @override
  Future<Either<Failure, List<ArticleModel>>> getArticles(
      {required Map<String, dynamic> params}) async {
    return await HandlingExceptionManager.wrapHandling(tryCall: () async {
      final model = await articlesDataSource.getArticlesDataSource(params: params);
      return Right(model);
    });
  }
}
