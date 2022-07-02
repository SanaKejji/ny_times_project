import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times/core/widgets/animated_list.dart';
import 'package:ny_times/core/widgets/app_loading_widget.dart';
import 'package:ny_times/features/most_popular_articles/domain/use_case/param/param.dart';
import 'package:ny_times/features/most_popular_articles/presentation/bloc/most_popular_articles_bloc.dart';
import 'package:ny_times/features/most_popular_articles/presentation/bloc/most_popular_articles_event.dart';
import 'package:ny_times/features/most_popular_articles/presentation/bloc/most_popular_articles_state.dart';
import 'package:ny_times/features/most_popular_articles/presentation/widgets/article_card.dart';

import '../../../../../core/widgets/app_error_widget.dart';

class ArticleListPage extends StatefulWidget {
  const ArticleListPage({Key? key, required this.period}) : super(key: key);
  final ArticlesPeriod period;
  @override
  State<ArticleListPage> createState() => _ArticleListPageState();
}

class _ArticleListPageState extends State<ArticleListPage> {
  late final MostPopularArticlesBloc _bloc;
  @override
  void initState() {
    _bloc = context.read<MostPopularArticlesBloc>();
    _bloc.add(ArticlesFetched(period: widget.period));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MostPopularArticlesBloc, MostPopularArticlesState>(
        builder: (context, state) {
      if (state.articlesStatus == ArticlesStatus.loading ||
          state.articlesStatus == ArticlesStatus.initial) {
        return const AppLoadingWidget();
      } else if (state.articlesStatus == ArticlesStatus.failure) {
        return AppErrorWidget(onClick: () => _bloc.add(ArticlesFetched(period: widget.period)));
      }
      return CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return AppAnimatedList(
                card: ArticleCard(
                  article: state.articles[index],
                ),
                index: index,
              );
            },
            childCount: state.articles.length,
          ))
        ],
      );
    });
  }
}
