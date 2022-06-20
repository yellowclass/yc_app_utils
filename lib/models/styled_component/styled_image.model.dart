class StyledImage {
  String url;

  StyledImage({
    required this.url,
  });

  StyledImage copyWith({
    String? url,
  }) {
    return StyledImage(
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  factory StyledImage.fromMap(Map<String, dynamic> map) {
    return StyledImage(
      url: map['url'] ?? '',
    );
  }
}
