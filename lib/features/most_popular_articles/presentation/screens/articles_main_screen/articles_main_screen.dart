import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ny_times/features/most_popular_articles/presentation/bloc/most_popular_articles_bloc.dart';
import 'package:ny_times/features/most_popular_articles/presentation/screens/articles_main_screen/articles_list_page.dart';
import 'package:ny_times/injection.dart';

import '../../../domain/use_case/param/param.dart';

class ArticlesMainScreen extends StatefulWidget {
  const ArticlesMainScreen({Key? key}) : super(key: key);

  @override
  State<ArticlesMainScreen> createState() => _ArticlesMainScreenState();
}

class _ArticlesMainScreenState extends State<ArticlesMainScreen> {
  late final MostPopularArticlesBloc _bloc;
  @override
  void initState() {
    _bloc = serviceLocator<MostPopularArticlesBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NY Times Articles'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueGrey,
      ),
      body: BlocProvider(
        create: (context) => _bloc,
        child: DefaultTabController(
            length: 3,
            child: Builder(builder: (context) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(children: <Widget>[
                  const SizedBox(height: 20),
                  Material(
                      child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(30)),
                    child: TabBar(
                      indicator: BoxDecoration(
                          color: Colors.blueGrey, borderRadius: BorderRadius.circular(30)),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(text: ArticlesPeriod.monthly.nameUpperCase),
                        Tab(text: ArticlesPeriod.weekly.nameUpperCase),
                        Tab(text: ArticlesPeriod.daily.nameUpperCase)
                      ],
                    ),
                  )),
                  const Expanded(
                      child: TabBarView(children: [
                    ArticleListPage(period: ArticlesPeriod.monthly),
                    ArticleListPage(period: ArticlesPeriod.weekly),
                    ArticleListPage(period: ArticlesPeriod.daily),
                  ]))
                ]),
              );
            })),
      ),
    );
  }
}
