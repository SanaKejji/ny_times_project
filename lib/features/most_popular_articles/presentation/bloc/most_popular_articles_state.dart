import 'package:equatable/equatable.dart';
import 'package:ny_times/features/most_popular_articles/data/models/article.dart';

enum ArticlesStatus { initial, success, failure, loading }

class MostPopularArticlesState extends Equatable {
  MostPopularArticlesState(
      {this.articles = const [], this.articlesStatus = ArticlesStatus.initial});

  List<ArticleModel> articles;
  ArticlesStatus articlesStatus;

  MostPopularArticlesState copyWith({
    List<ArticleModel>? articles,
    ArticlesStatus? articlesStatus,
  }) {
    return MostPopularArticlesState(
      articles: articles ?? this.articles,
      articlesStatus: articlesStatus ?? this.articlesStatus,
    );
  }

  @override
  List<Object?> get props => [articles, articlesStatus];
}
