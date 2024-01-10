import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/section_background/radial_gradient.model.dart';
import 'package:yc_app_utils/models/section_background/section_background_direction.enum.dart';
import 'package:yc_app_utils/models/section_background/section_bg_type.enum.dart';

class SectionBackground {
  SectionBackground({
    required this.backgroundType,
    this.backgroundImgBoxFit,
    this.backgroundColor,
    this.gradientColor1,
    this.gradientColor2,
    this.gradientDirection,
    this.shouldLeaveBorder = false,
    this.backgroundImgUrl,
    this.gradientColors,
    this.radialGradient,
    this.borderRadius,
    this.borderColor,
    this.borderWidth = 0,
    this.opacity=1,
  });

  final SectionBgType backgroundType;
  final String? backgroundColor;
  final String? gradientColor1;
  final String? gradientColor2;
  final SectionGradientDirections? gradientDirection;
  final bool shouldLeaveBorder;
  final String? backgroundImgUrl;
  final List<String>? gradientColors;
  final YcRadialGradient? radialGradient;
  final BoxFit? backgroundImgBoxFit;
  final List<int>? borderRadius;
  final String? borderColor;
  final double borderWidth;
  final double opacity;

  SectionBackground copyWith({
    SectionBgType? backgroundType,
    String? backgroundColor,
    String? gradientColor1,
    String? gradientColor2,
    SectionGradientDirections? gradientDirection,
    bool? shouldLeaveBorder,
    String? backgroundImgUrl,
    List<String>? gradientColors,
    YcRadialGradient? radialGradient,
    BoxFit? backgroundImgBoxFit,
    List<int>? borderRadius,
    String? borderColor,
    double? borderWidth,
    double? opacity,
  }) =>
      SectionBackground(
        backgroundType: backgroundType ?? this.backgroundType,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        gradientColor1: gradientColor1 ?? this.gradientColor1,
        gradientColor2: gradientColor2 ?? this.gradientColor2,
        gradientDirection: gradientDirection ?? this.gradientDirection,
        shouldLeaveBorder: shouldLeaveBorder ?? this.shouldLeaveBorder,
        backgroundImgUrl: backgroundImgUrl ?? this.backgroundImgUrl,
        gradientColors: gradientColors ?? this.gradientColors,
        radialGradient: radialGradient ?? this.radialGradient,
        backgroundImgBoxFit: backgroundImgBoxFit ?? this.backgroundImgBoxFit,
        borderRadius: borderRadius ?? this.borderRadius,
        borderColor: borderColor ?? this.borderColor,
        borderWidth: borderWidth ?? this.borderWidth,
        opacity: opacity?? this.opacity,
      );

  factory SectionBackground.fromMap(Map<String, dynamic> json) =>
      SectionBackground(
        backgroundType: CommonHelpers.enumFromString(
              SectionBgType.values,
              json["backgroundType"],
            ) ??
            SectionBgType.TRANSPARENT,
        backgroundColor: json["backgroundColor"],
        gradientColor1: json["gradientColor1"],
        gradientColor2: json["gradientColor2"],
        gradientDirection: CommonHelpers.enumFromString(
            SectionGradientDirections.values, json["gradientDirection"]),
        shouldLeaveBorder: json["shouldLeaveBorder"] ?? false,
        backgroundImgUrl: json["backgroundImgUrl"],
        gradientColors: json["gradientColors"] != null
            ? List<String>.from(
                json["gradientColors"].map((x) => x.toString()),
              )
            : null,
        radialGradient: json["radialGradient"] != null
            ? YcRadialGradient.fromMap(json["radialGradient"])
            : null,
        backgroundImgBoxFit: json["boxFit"] != null
            ? CommonHelpers.getBoxFitFromString(json["boxFit"])
            : null,
        borderRadius: json['borderRadius'] == null
            ? <int>[]
            : List<int>.from(json['borderRadius']),
        borderColor: json["borderColor"],
        borderWidth: json["borderWidth"] ?? 0,
        opacity: json["opacity"]!=null ? json["opacity"]/100 : 1,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        "backgroundType": backgroundType.name,
        "backgroundColor": backgroundColor,
        "gradientColor1": gradientColor1,
        "gradientColor2": gradientColor2,
        "gradientDirection": gradientDirection?.name,
        "shouldLeaveBorder": shouldLeaveBorder,
        "backgroundImgUrl": backgroundImgUrl,
        "gradientColors": gradientColors,
        "radialGradient": radialGradient?.toMap(),
        "boxFit": backgroundImgBoxFit?.name,
        'borderRadius': borderRadius,
        'borderColor': borderColor,
        'borderWidth': borderWidth,
        'opacity': opacity,
      };

  String toJson() => json.encode(toMap());

  factory SectionBackground.fromJson(Map<String, dynamic> source) {
    return SectionBackground.fromMap(source);
  }

  factory SectionBackground.transparent() {
    return SectionBackground(backgroundType: SectionBgType.TRANSPARENT);
  }
}
