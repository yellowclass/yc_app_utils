import 'package:yc_app_utils/models/styled_component/styled_component_union.dart';

class StyledImageModel with StyledComponentUnion {
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
