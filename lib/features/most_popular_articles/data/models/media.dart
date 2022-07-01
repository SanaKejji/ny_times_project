import 'package:json_annotation/json_annotation.dart';
part 'media.g.dart';

@JsonSerializable(explicitToJson: true)
class Media {
  Media({
    required this.type,
    required this.caption,
    required this.mediaMetadata,
  });

  final String? type;

  final String? caption;

  final List<MediaMetadata>? mediaMetadata;

  factory Media.fromJson(Map<String, dynamic> json) {
    return _$MediaFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MediaToJson(this);
  }
}

@JsonSerializable()
class MediaMetadata {
  MediaMetadata({
    required this.url,
    required this.format,
  });

  final String? url;
  final MediaType? format;

  factory MediaMetadata.fromJson(Map<String, dynamic> json) {
    return _$MediaMetadataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MediaMetadataToJson(this);
  }
}

enum MediaType {
  thumbnail,
  mediumThreeByTwo210,
  mediumThreeByTwo440,
}

extension MediaTypeEx on MediaType {
  String get name {
    switch (this) {
      case MediaType.thumbnail:
        return 'Standard Thumbnail';
      case MediaType.mediumThreeByTwo210:
        return 'mediumThreeByTwo210';
      case MediaType.mediumThreeByTwo440:
        return 'mediumThreeByTwo440';
    }
  }
}

Map<String, MediaType> mapNames() {
  return Map.fromEntries(MediaType.values.map((e) => MapEntry(e.name, e)));
}
