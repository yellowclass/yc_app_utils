import 'dart:convert';

import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/section_background/radial_gradient.model.dart';
import 'package:yc_app_utils/models/section_background/section_background_direction.enum.dart';
import 'package:yc_app_utils/models/section_background/section_bg_type.enum.dart';

class SectionBackground {
  SectionBackground({
    required this.backgroundType,
    this.backgroundColor,
    this.gradientColor1,
    this.gradientColor2,
    this.gradientDirection,
    this.shouldLeaveBorder = false,
    this.backgroundImgUrl,
    this.gradientColors,
    this.radialGradient,
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
      };

  String toJson() => json.encode(toMap());

  factory SectionBackground.fromJson(Map<String, dynamic> source) =>
      SectionBackground.fromMap(source);

  factory SectionBackground.transparent() =>
      SectionBackground(backgroundType: SectionBgType.TRANSPARENT);
}
