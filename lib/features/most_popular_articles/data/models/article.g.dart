// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleModel _$ArticleModelFromJson(Map<String, dynamic> json) => ArticleModel(
      url: json['url'] as String?,
      id: json['id'] as int,
      source: json['source'] as String,
      publishedDate: json['publishedDate'] == null
          ? null
          : DateTime.parse(json['publishedDate'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      section: json['section'] as String?,
      byline: json['byline'] as String?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      articleAbstract: json['articleAbstract'] as String?,
      media: (json['media'] as List<dynamic>?)
          ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArticleModelToJson(ArticleModel instance) =>
    <String, dynamic>{
      'url': instance.url,
      'id': instance.id,
      'source': instance.source,
      'publishedDate': instance.publishedDate?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'section': instance.section,
      'byline': instance.byline,
      'type': instance.type,
      'title': instance.title,
      'articleAbstract': instance.articleAbstract,
      'media': instance.media?.map((e) => e.toJson()).toList(),
    };
