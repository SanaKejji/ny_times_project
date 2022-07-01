import 'package:ny_times/features/most_popular_articles/domain/use_case/param/param.dart';

abstract class MostPopularArticlesEvent {}

class ArticlesFetched extends MostPopularArticlesEvent {
  final ArticlesPeriod period;
  ArticlesFetched({required this.period});
}
