import 'package:json_annotation/json_annotation.dart';

import 'media.dart';
import 'package:collection/collection.dart';
part 'article.g.dart';

List<ArticleModel> articlesListFromMap(List list) =>
    List<ArticleModel>.from(list.map((x) => ArticleModel.fromJson(x)));

@JsonSerializable(explicitToJson: true)
class ArticleModel {
  ArticleModel({
    required this.url,
    required this.id,
    required this.source,
    required this.publishedDate,
    required this.updated,
    required this.section,
    required this.byline,
    required this.type,
    required this.title,
    required this.articleAbstract,
    required this.media,
  });

  final String? url;
  final int id;
  final String source;
  final DateTime? publishedDate;
  final DateTime? updated;
  final String? section;
  final String? byline;
  final String? type;
  final String? title;
  final String? articleAbstract;
  final List<Media>? media;

  Media? image() {
    return media?.firstWhereOrNull((element) => element.type == 'image');
  }

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return _$ArticleModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ArticleModelToJson(this);
  }
}

extension ArticleExt on ArticleModel {
  MediaMetadata? get thumb {
    return image()?.mediaMetadata?.firstWhere((element) => element.format == MediaType.thumbnail);
  }

  MediaMetadata? get image210 {
    return image()
        ?.mediaMetadata
        ?.firstWhere((element) => element.format == MediaType.mediumThreeByTwo210);
  }

  MediaMetadata? get image440 {
    return image()
        ?.mediaMetadata
        ?.firstWhere((element) => element.format == MediaType.mediumThreeByTwo440);
  }
}
