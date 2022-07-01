import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ny_times/core/widgets/cached_network_image.dart';
import 'package:ny_times/features/most_popular_articles/data/models/article.dart';
import 'package:timeago/timeago.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class ArticleDetailsPage extends StatefulWidget {
  const ArticleDetailsPage({Key? key, required this.article}) : super(key: key);
  final ArticleModel? article;
  static navigator({required BuildContext context, required ArticleModel? article}) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ArticleDetailsPage(
                  article: article,
                )));
  }

  @override
  State<ArticleDetailsPage> createState() => _ArticleDetailsPageState();
}

class _ArticleDetailsPageState extends State<ArticleDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final url = widget.article?.image440?.url;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              leading: const Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                color: Colors.black26,
                child: BackButton(color: Colors.white),
              ),
              expandedHeight: 200,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                  background: CachedNetworkImageView(
                url: url ?? '',
              )),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Row(
                      children: [
                        Text(widget.article?.section ?? ''),
                        const Spacer(),
                        Text(DateFormat.yMMMMEEEEd()
                            .format(widget.article?.publishedDate ?? DateTime.now())),
                      ],
                    ),
                    Row(
                      children: [
                        Text(widget.article?.source ?? ''),
                        const Spacer(),
                        Text('updated: ${format(widget.article?.updated ?? DateTime.now())}'),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(widget.article?.title ?? '',
                        style: const TextStyle(color: Colors.blueGrey, fontSize: 30)),
                    const SizedBox(height: 12),
                    Text(widget.article?.articleAbstract ?? '',
                        textAlign: TextAlign.justify,
                        style: const TextStyle(color: Colors.blueGrey, fontSize: 30)),
                    const SizedBox(height: 12),
                    Text(
                      widget.article?.byline ?? '',
                      style: const TextStyle(color: Colors.blueGrey, fontSize: 16),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () => url_launcher.launchUrl(Uri.parse(widget.article?.url ?? '')),
        child: Container(
          color: Colors.blueGrey,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.link, size: 30, color: Colors.white),
              SizedBox(
                width: 20,
              ),
              Text(
                'Read More About This!..',
                style: TextStyle(color: Colors.white, fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
