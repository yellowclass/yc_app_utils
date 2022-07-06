import 'package:flutter/material.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class BootstrapChildModel with BootstrapSectionUnion {
  String classes;
  BootstrapChildUnion? bcData;
  SectionBackground? background;
  String? borderColor;
  List<int>? borderRadius;
  List<int>? padding;
  double? height;
  Alignment? boxAlignment;

  BootstrapChildModel({
    required this.classes,
    this.bcData,
    this.background,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.height,
    this.boxAlignment,
  });

  Map<String, dynamic> toMap() {
    return {
      'classes': classes,
      // 'child': child?.toMap(),
      'background': background?.toMap(),
      'borderColor': borderColor,
      'borderRadius': borderRadius,
      'padding': padding,
      'height': height,
      // 'boxAlignment': boxAlignment?.name,
    };
  }

  factory BootstrapChildModel.fromMap(Map<String, dynamic> map) {
    BootstrapChildUnion? child;
    switch (map['bcData']['__typename']) {
      case 'StyledComponent':
        child = StyledComponentModel.fromMap(
          map['bcData'],
        );
        break;
      case 'FormComponent':
        child = FormComponentModel.fromMap(
          map['bcData'],
        );
        break;
      case 'BootstrapSection':
        child = BootstrapSectionModel.fromMap(
          map['bcData'],
        );
        break;
      default:
    }
    return BootstrapChildModel(
      classes: map['classes'] ?? '',
      bcData: child,
      background: map['background'] != null
          ? SectionBackground.fromMap(map['background'])
          : null,
      borderColor: map['borderColor'],
      borderRadius: map['borderRadius'] == null
          ? <int>[]
          : List<int>.from(map['borderRadius']),
      padding:
          map['padding'] == null ? <int>[] : List<int>.from(map['padding']),
      height: map['height']?.toDouble(),
      boxAlignment: map['boxAlignment'] != null
          ? CommonHelpers.getAlignmentFromString(
              map['boxAlignment'],
            )
          : null,
    );
  }
}
