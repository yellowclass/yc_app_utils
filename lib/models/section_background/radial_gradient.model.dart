import 'package:flutter/material.dart';

import 'package:yc_app_utils/helpers/common_helpers.dart';

class YcRadialGradient {
  double? radius;
  Alignment? center;

  YcRadialGradient({
    this.radius,
    this.center,
  });

  YcRadialGradient copyWith({
    double? radius,
    Alignment? center,
  }) {
    return YcRadialGradient(
      radius: radius ?? this.radius,
      center: center ?? this.center,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'radius': radius,
      'center': center.toString(),
    };
  }

  factory YcRadialGradient.fromMap(Map<String, dynamic> map) {
    return YcRadialGradient(
      radius: map['radius']?.toDouble(),
      center: map['center'] != null
          ? CommonHelpers.getAlignmentFromString(map["center"])
          : null,
    );
  }
}
