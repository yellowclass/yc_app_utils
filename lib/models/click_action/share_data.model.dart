class ShareData {
  String url;
  String entityTitle;
  String entityType;
  String source;

  String? entityId;
  String? entityImageUrl;
  String? extraParams;

  ShareData({
    required this.url,
    required this.entityTitle,
    required this.entityType,
    required this.source,
    this.entityId,
    this.entityImageUrl,
    this.extraParams,
  });

  ShareData copyWith({
    String? url,
    String? entityTitle,
    String? entityType,
    String? source,
    String? entityId,
    String? entityImageUrl,
    String? extraParams,
  }) {
    return ShareData(
      url: url ?? this.url,
      entityTitle: entityTitle ?? this.entityTitle,
      entityType: entityType ?? this.entityType,
      source: source ?? this.source,
      entityId: entityId ?? this.entityId,
      entityImageUrl: entityImageUrl ?? this.entityImageUrl,
      extraParams: extraParams ?? this.extraParams,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'entityTitle': entityTitle,
      'entityType': entityType,
      'source': source,
      "entityId": entityId,
      "entityImageUrl": entityImageUrl,
      "extraParams": extraParams,
    };
  }

  factory ShareData.fromMap(Map<String, dynamic> map) {
    return ShareData(
      url: map['url'] ?? '',
      entityTitle: map['entityTitle'] ?? '',
      entityType: map['entityType'] ?? '',
      source: map['source'] ?? '',
      extraParams: map["extraParams"],
      entityImageUrl: map["entityImageUrl"],
      entityId: map["entityId"],
    );
  }
}
