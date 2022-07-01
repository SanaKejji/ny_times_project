import 'package:dartz/dartz.dart';
import 'package:ny_times/features/most_popular_articles/data/models/article.dart';
import 'package:ny_times/features/most_popular_articles/domain/repository/most_popular_articls_repository.dart';
import 'package:ny_times/features/most_popular_articles/domain/use_case/param/param.dart';
import '../../../../../../../core/use_case/use_case.dart';
import '../../../../core/error/failures.dart';

class GetArticleUseCase implements UseCase<List<ArticleModel>, MostPopularParams> {
  GetArticleUseCase({required this.articlesRepo});

  final MostPopularArticlesRepo articlesRepo;

  @override
  Future<Either<Failure, List<ArticleModel>>> call(MostPopularParams param) async {
    return await articlesRepo.getArticles(params: param.toMap());
  }
}
