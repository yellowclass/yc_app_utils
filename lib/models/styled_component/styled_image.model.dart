import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/helpers.dart';

import 'package:yc_app_utils/models/styled_component/styled_component_union.dart';

class StyledImageModel with StyledComponentUnion {
  String url;
  String? fillColor;
  ImageCropTypes? cropType;
  double? width;
  double? height;
  List<int>? borderRadius;
  BoxFit? imageFit;

  StyledImageModel({
    required this.url,
    this.fillColor,
    this.cropType,
    this.width,
    this.height,
    this.borderRadius,
    this.imageFit,
  });

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'fillColor': fillColor,
      'cropType': cropType?.name,
      'width': width,
      'height': height,
      'borderRadius': borderRadius,
      'imageFit': imageFit?.name,
    };
  }

  factory StyledImageModel.fromMap(Map<String, dynamic> map) {
    return StyledImageModel(
      url: map['url'] ?? '',
      fillColor: map['fillColor'],
      cropType: map['cropType'] != null
          ? CommonHelpers.enumFromString(
              ImageCropTypes.values,
              map['cropType'],
            )
          : null,
      width: map['width']?.toDouble(),
      height: map['height']?.toDouble(),
      borderRadius: map['borderRadius'] == null
          ? <int>[]
          : List<int>.from(map['borderRadius']),
      imageFit: map['imageFit'] != null
          ? CommonHelpers.enumFromString(
              BoxFit.values,
              map['imageFit'],
            )
          : null,
    );
  }
}

enum ImageCropTypes {
  SQUARE,
  CIRCLE,
}
