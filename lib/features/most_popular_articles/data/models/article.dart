import 'package:json_annotation/json_annotation.dart';

import 'media.dart';
import 'package:collection/collection.dart';

List<ArticleModel> articlesListFromMap(List list) =>
    List<ArticleModel>.from(list.map((x) => ArticleModel.fromJson(x)));

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
    required this.abstract,
    required this.media,
  });

  final String? url;
  final int id;
  final String source;
  final DateTime publishedDate;
  final DateTime updated;
  final String section;
  final String byline;
  final String type;
  final String title;
  final String abstract;
  final List<Media> media;

  Media? image() {
    return media.firstWhereOrNull((element) => element.type == 'image');
  }

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      url: json['url'],
      id: json['id'],
      source: json['source'],
      publishedDate: DateTime.parse(json['published_date']),
      updated: DateTime.parse(json['updated']),
      section: json['section'],
      byline: json['byline'],
      type: json['type'],
      title: json['title'],
      abstract: json['abstract'],
      media: (json['media'] as List<dynamic>)
          .map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

extension ArticleExt on ArticleModel {
  MediaMetadata? get thumb {
    return image()?.mediaMetadata.firstWhere((element) => element.format == MediaType.thumbnail);
  }

  MediaMetadata? get image210 {
    return image()
        ?.mediaMetadata
        .firstWhere((element) => element.format == MediaType.mediumThreeByTwo210);
  }

  MediaMetadata? get image440 {
    return image()
        ?.mediaMetadata
        .firstWhere((element) => element.format == MediaType.mediumThreeByTwo440);
  }
}
