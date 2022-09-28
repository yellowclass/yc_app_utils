import 'package:yc_app_utils/helpers/common_helpers.dart';

enum MediaTypeEnum {
  IMAGE,
  VIDEO,
  PDF,
  AUDIO,
}

class EmbeddedMediaModel {
  MediaTypeEnum type;
  String url;

  EmbeddedMediaModel({
    required this.type,
    required this.url,
  });

  EmbeddedMediaModel copyWith({
    MediaTypeEnum? type,
    String? url,
  }) {
    return EmbeddedMediaModel(
      type: type ?? this.type,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': this.type.name,
      'url': this.url,
    };
  }

  factory EmbeddedMediaModel.fromMap(Map<String, dynamic> map) {
    return EmbeddedMediaModel(
      type: CommonHelpers.enumFromString(MediaTypeEnum.values, map['type'])!,
      url: map['url'],
    );
  }
}
