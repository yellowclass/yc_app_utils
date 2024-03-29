// ignore_for_file: constant_identifier_names
import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/models.import.dart';

enum MediaTypeEnum {
  IMAGE,
  VIDEO,
  PDF,
  AUDIO,
}

class EmbeddedMediaModel {
  MediaTypeEnum type;
  String url;
  V2ClickAction? v2ClickAction;
  double? aspectRatio;
  bool isLooping;
  String? thumbnailUrl;

  EmbeddedMediaModel({
    required this.type,
    required this.url,
    this.v2ClickAction,
    this.aspectRatio,
    this.isLooping = false,
    this.thumbnailUrl,
  });

  EmbeddedMediaModel copyWith({
    MediaTypeEnum? type,
    String? url,
    V2ClickAction? v2ClickAction,
    double? aspectRatio,
    bool? isLooping,
    String? thumbnailUrl,
  }) {
    return EmbeddedMediaModel(
      type: type ?? this.type,
      url: url ?? this.url,
      v2ClickAction: v2ClickAction ?? this.v2ClickAction,
      aspectRatio: aspectRatio ?? this.aspectRatio,
      isLooping: isLooping ?? this.isLooping,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type.name,
      'url': url,
      'v2ClickAction': v2ClickAction,
      'aspectRatio': aspectRatio,
      'isLooping': isLooping,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory EmbeddedMediaModel.fromMap(Map<String, dynamic> map) {
    return EmbeddedMediaModel(
      type: CommonHelpers.enumFromString(MediaTypeEnum.values, map['type'])!,
      url: map['url'],
      v2ClickAction: map['v2ClickAction'],
      aspectRatio: map['aspectRatio'],
      isLooping: map['isLooping'] ?? false,
      thumbnailUrl: map['thumbnailUrl'],
    );
  }
}
