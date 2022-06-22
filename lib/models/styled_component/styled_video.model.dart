class StyledVideoModel {
  String url;
  String thumbnail;

  StyledVideoModel({
    required this.url,
    required this.thumbnail,
  });

  StyledVideoModel copyWith({
    String? url,
    String? thumbnail,
  }) {
    return StyledVideoModel(
      url: url ?? this.url,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'thumbnail': thumbnail,
    };
  }

  factory StyledVideoModel.fromMap(Map<String, dynamic> map) {
    return StyledVideoModel(
      url: map['url'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
    );
  }
}
