class ShareData {
  String url;
  String entityTitle;
  String entityType;
  String source;

  ShareData({
    required this.url,
    required this.entityTitle,
    required this.entityType,
    required this.source,
  });

  ShareData copyWith({
    String? url,
    String? entityTitle,
    String? entityType,
    String? source,
  }) {
    return ShareData(
      url: url ?? this.url,
      entityTitle: entityTitle ?? this.entityTitle,
      entityType: entityType ?? this.entityType,
      source: source ?? this.source,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'entityTitle': entityTitle,
      'entityType': entityType,
      'source': source,
    };
  }

  factory ShareData.fromMap(Map<String, dynamic> map) {
    return ShareData(
      url: map['url'] ?? '',
      entityTitle: map['entityTitle'] ?? '',
      entityType: map['entityType'] ?? '',
      source: map['source'] ?? '',
    );
  }
}
