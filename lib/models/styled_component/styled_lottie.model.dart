// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/styled_component/styled_component_union.dart';

class StyledLottieModel extends StyledComponentUnion {
  String url;
  int? width;
  int? height;
  BoxFit? lottieFit;
  int? animateOnPercentage;
  int? animateAfter;
  BorderRadius? borderRadius;

  StyledLottieModel({
    required this.url,
    this.width,
    this.height,
    this.lottieFit,
    this.animateOnPercentage,
    this.animateAfter,
    this.borderRadius,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
      'width': width,
      'height': height,
      'lottieFit': lottieFit?.toString(),
      'borderRadius': borderRadius,
    };
  }

  factory StyledLottieModel.fromMap(Map<String, dynamic> map) {
    return StyledLottieModel(
      url: map['url'] as String,
      width:
          map['width'] != null ? int.tryParse(map['width'].toString()) : null,
      height:
          map['height'] != null ? int.tryParse(map['height'].toString()) : null,
      lottieFit: map['lottieFit'] != null
          ? CommonHelpers.enumFromString(
              BoxFit.values,
              map['lottieFit'],
            )
          : null,
      animateOnPercentage: map['animateOnPercentage'],
      animateAfter: map['animateAfter'],
      borderRadius: map['borderRadius'] != null
          ? CommonHelpers.getBorderRadiusFromList(
              List<int>.from(map['borderRadius']))
          : const BorderRadius.all(
              Radius.zero,
            ),
    );
  }
}
