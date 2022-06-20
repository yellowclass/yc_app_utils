import 'dart:convert';

class ImageModel {
  String? id;
  String? url;
  String? entityType;
  String? entityId;
  String? badge;
  String? badgePosition;
  String? fillColor;
  double? height;
  double? width;
  String? cropType;

  ImageModel({
    this.id,
    this.url,
    this.entityType,
    this.entityId,
    this.badge,
    this.badgePosition,
    this.fillColor,
    this.height,
    this.width,
    this.cropType,
  });

  ImageModel copyWith({
    String? id,
    String? url,
    String? entityType,
    String? entityId,
    String? badge,
    String? badgePosition,
    String? fillColor,
    String? cropType,
  }) {
    return ImageModel(
      id: id ?? this.id,
      url: url ?? this.url,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      badge: badge ?? this.badge,
      badgePosition: badgePosition ?? this.badgePosition,
      fillColor: fillColor ?? this.fillColor,
      cropType: cropType ?? this.cropType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'url': url,
      'entityType': entityType,
      'entityId': entityId,
      'badge': badge,
      'badgePosition': badgePosition,
      'fillColor': fillColor,
      'height': height,
      'width': width,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'] != null ? map['id'] : null,
      url: map['url'] != null ? map['url'] : null,
      entityType: map['entityType'] != null ? map['entityType'] : null,
      entityId: map['entityId'] != null ? map['entityId'] : null,
      badge: map['badge'] != null ? map['badge'] : null,
      badgePosition: map['badgePosition'] != null ? map['badgePosition'] : null,
      fillColor: map['fillColor'] != null ? map['fillColor'] : null,
      height: map['height'] != null ? map['height'].toDouble() : null,
      width: map['width'] != null ? map['width'].toDouble() : null,
      cropType: map['cropType'] != null ? map['cropType'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) =>
      ImageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ImageModel(id: $id, url: $url, entityType: $entityType, entityId: $entityId, badge: $badge, badgePosition: $badgePosition)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ImageModel &&
        other.id == id &&
        other.url == url &&
        other.entityType == entityType &&
        other.entityId == entityId &&
        other.badge == badge &&
        other.badgePosition == badgePosition &&
        other.height == height &&
        other.width == width;
  }
}

class ImageInputModel {
  String? id;
  String? url;
  String? entityType;
  String? entityId;

  ImageInputModel({
    this.id,
    this.url,
    this.entityType,
    this.entityId,
  });

  ImageInputModel copyWith({
    String? id,
    String? url,
    String? entityType,
    String? entityId,
  }) {
    return ImageInputModel(
      id: id ?? this.id,
      url: url ?? this.url,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'url': url,
      'entityType': entityType,
      'entityId': entityId,
    };
  }

  factory ImageInputModel.fromMap(Map<String, dynamic> map) {
    return ImageInputModel(
      id: map['id'] != null ? map['id'] : null,
      url: map['url'] != null ? map['url'] : null,
      entityType: map['entityType'] != null ? map['entityType'] : null,
      entityId: map['entityId'] != null ? map['entityId'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageInputModel.fromJson(String source) =>
      ImageInputModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ImageModel(id: $id, url: $url, entityType: $entityType, entityId: $entityId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ImageInputModel &&
        other.id == id &&
        other.url == url &&
        other.entityType == entityType &&
        other.entityId == entityId;
  }
}
