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
  List<int>? padding;

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
    this.padding,
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
    List<int>? padding,
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
      padding: padding ?? this.padding,
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
      'padding': padding?.toList(),
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      id: map['id'],
      url: map['url'],
      entityType: map['entityType'],
      entityId: map['entityId'],
      badge: map['badge'],
      badgePosition: map['badgePosition'],
      fillColor: map['fillColor'],
      height: map['height']?.toDouble(),
      width: map['width']?.toDouble(),
      cropType: map['cropType'],
      padding: map["padding"] != null ? List<int>.from(map["padding"]) : null,
    );
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
      id: map['id'],
      url: map['url'],
      entityType: map['entityType'],
      entityId: map['entityId'],
    );
  }
}
