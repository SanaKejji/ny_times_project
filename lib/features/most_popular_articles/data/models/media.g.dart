// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) => Media(
      type: json['type'] as String?,
      caption: json['caption'] as String?,
      mediaMetadata: (json['mediaMetadata'] as List<dynamic>?)
          ?.map((e) => MediaMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'type': instance.type,
      'caption': instance.caption,
      'mediaMetadata': instance.mediaMetadata?.map((e) => e.toJson()).toList(),
    };

MediaMetadata _$MediaMetadataFromJson(Map<String, dynamic> json) =>
    MediaMetadata(
      url: json['url'] as String?,
      format: $enumDecodeNullable(_$MediaTypeEnumMap, json['format']),
    );

Map<String, dynamic> _$MediaMetadataToJson(MediaMetadata instance) =>
    <String, dynamic>{
      'url': instance.url,
      'format': _$MediaTypeEnumMap[instance.format],
    };

const _$MediaTypeEnumMap = {
  MediaType.thumbnail: 'thumbnail',
  MediaType.mediumThreeByTwo210: 'mediumThreeByTwo210',
  MediaType.mediumThreeByTwo440: 'mediumThreeByTwo440',
};
