class StyledImageModel {
  String url;

  StyledImageModel({
    required this.url,
  });

  StyledImageModel copyWith({
    String? url,
  }) {
    return StyledImageModel(
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
    };
  }

  factory StyledImageModel.fromMap(Map<String, dynamic> map) {
    return StyledImageModel(
      url: map['url'] ?? '',
    );
  }
}
