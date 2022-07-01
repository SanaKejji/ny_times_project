import 'package:flutter/material.dart';
import 'package:ny_times/features/most_popular_articles/data/models/article.dart';
import 'package:ny_times/features/most_popular_articles/presentation/screens/article_details_screen.dart';
import '../../../../core/widgets/cached_network_image.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleCard extends StatelessWidget {
  const ArticleCard({Key? key, required this.article}) : super(key: key);
  final ArticleModel? article;
  @override
  Widget build(BuildContext context) {
    var thumb = article!.thumb?.url;
    return GestureDetector(
      onTap: () => ArticleDetailsPage.navigator(context: context, article: article),
      child: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 120,
            child: Card(
              elevation: 1.5,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.grey.shade300, width: 0.5),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(360),
                    bottomLeft: Radius.circular(360),
                    bottomRight: Radius.circular(45),
                    topRight: Radius.circular(45)),
              ),
              child: Container(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  children: [
                    Container(
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(360),
                            child: CachedNetworkImageView(
                              url: thumb ?? '',
                              boxFit: BoxFit.cover,
                            ))),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(article?.title ?? '',
                                style: const TextStyle(
                                    fontSize: 15,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey)),
                            Text(article?.byline ?? ''),
                            Row(
                              children: [
                                Text(article?.section ?? ''),
                                const Spacer(),
                                Text(timeago.format(article?.updated ?? DateTime.now())),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
