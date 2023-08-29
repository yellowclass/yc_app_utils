// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:yc_app_utils/models/styled_component/styled_component_union.dart';

class StyledLottieModel with StyledComponentUnion {
  String url;
  int? width;
  int? height;
  StyledLottieModel({
    required this.url,
    this.width,
    this.height,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'width': width,
      'height': height,
    };
  }

  factory StyledLottieModel.fromMap(Map<String, dynamic> map) {
    return StyledLottieModel(
      url: map['url'] as String,
      width: map['width'] != null ? map['width'] as int : null,
      height: map['height'] != null ? map['height'] as int : null,
    );
  }
}
