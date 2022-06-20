class StyledVideo {
  String url;
  String thumbnail;

  StyledVideo({
    required this.url,
    required this.thumbnail,
  });

  StyledVideo copyWith({
    String? url,
    String? thumbnail,
  }) {
    return StyledVideo(
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

  factory StyledVideo.fromMap(Map<String, dynamic> map) {
    return StyledVideo(
      url: map['url'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
    );
  }
}
