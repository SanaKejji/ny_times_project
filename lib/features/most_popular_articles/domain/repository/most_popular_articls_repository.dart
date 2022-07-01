import 'package:dartz/dartz.dart';
import 'package:ny_times/features/most_popular_articles/data/models/article.dart';
import '../../../../../../../core/error/failures.dart';

abstract class MostPopularArticlesRepo {
  Future<Either<Failure, List<ArticleModel>>> getArticles({required Map<String, dynamic> params});
}
