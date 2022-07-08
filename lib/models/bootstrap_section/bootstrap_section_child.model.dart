import 'package:flutter/material.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class BootstrapSectionChildModel with BootstrapSectionUnion {
  String classes;
  BootstrapChildUnion? bcData;
  SectionBackground? background;
  String? borderColor;
  List<int>? borderRadius;
  List<int>? padding;
  double? height;
  Alignment? boxAlignment;

  BootstrapSectionChildModel({
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
    Map<String, dynamic> bcDataMap = {};
    switch (bcData.runtimeType) {
      case StyledComponentModel:
        bcDataMap = (bcData as StyledComponentModel).toMap();
        break;
      case FormComponentModel:
        bcDataMap = (bcData as FormComponentModel).toMap();
        break;
      case BootstrapSectionModel:
        bcDataMap = (bcData as BootstrapSectionModel).toMap();
        break;
      default:
    }
    return {
      'classes': classes,
      'bcData': bcDataMap,
      'background': background?.toMap(),
      'borderColor': borderColor,
      'borderRadius': borderRadius,
      'padding': padding,
      'height': height,
      // 'boxAlignment': boxAlignment?.name,
    };
  }

  factory BootstrapSectionChildModel.fromMap(Map<String, dynamic> map) {
    BootstrapChildUnion? child;
    switch (map['bcData']?['__typename']) {
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
    return BootstrapSectionChildModel(
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
