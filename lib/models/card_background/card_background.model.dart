import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/section_background/section_background_direction.enum.dart';
import 'package:yc_app_utils/models/section_background/section_bg_type.enum.dart';

class CardBackground {
  CardBackground({
    this.backgroundType,
    this.backgroundColor,
    this.backgroundImageUrl,
    this.aspectRatio,
    this.gradientColor1,
    this.gradientColor2,
    this.gradientDirection,
    this.shouldLeaveBorder = false,
  });

  SectionBgType? backgroundType;
  String? backgroundColor;
  String? backgroundImageUrl;
  String? aspectRatio;
  String? gradientColor1;
  String? gradientColor2;
  SectionGradientDirections? gradientDirection;
  bool shouldLeaveBorder;

  factory CardBackground.fromMap(Map<String, dynamic> json) => CardBackground(
        backgroundType: CommonHelpers.enumFromString(
              SectionBgType.values,
              json["backgroundType"],
            ) ??
            SectionBgType.TRANSPARENT,
        backgroundColor: json["backgroundColor"],
        backgroundImageUrl: json["backgroundImageUrl"],
        aspectRatio: json["aspectRatio"],
        gradientColor1: json["gradientColor1"],
        gradientColor2: json["gradientColor2"],
        gradientDirection: CommonHelpers.enumFromString(
            SectionGradientDirections.values, json["gradientDirection"]),
        shouldLeaveBorder: json["shouldLeaveBorder"] ?? false,
      );

  CardBackground copyWith({
    SectionBgType? backgroundType,
    String? backgroundColor,
    String? backgroundImageUrl,
    String? aspectRatio,
    String? gradientColor1,
    String? gradientColor2,
    SectionGradientDirections? gradientDirection,
    bool? shouldLeaveBorder,
  }) =>
      CardBackground(
        backgroundType: backgroundType ?? this.backgroundType,
        backgroundColor: backgroundColor ?? this.backgroundColor,
        backgroundImageUrl: backgroundImageUrl ?? this.backgroundImageUrl,
        aspectRatio: aspectRatio ?? this.aspectRatio,
        gradientColor1: gradientColor1 ?? this.gradientColor1,
        gradientColor2: gradientColor2 ?? this.gradientColor2,
        gradientDirection: gradientDirection ?? this.gradientDirection,
        shouldLeaveBorder: shouldLeaveBorder ?? this.shouldLeaveBorder,
      );

  Map<String, dynamic> toMap() => {
        "backgroundType": backgroundType?.name,
        "backgroundColor": backgroundColor,
        "backgroundImageUrl": backgroundImageUrl,
        "aspectRatio": aspectRatio,
        "gradientColor1": gradientColor1,
        "gradientColor2": gradientColor2,
        "gradientDirection": gradientDirection?.name,
        "shouldLeaveBorder": shouldLeaveBorder,
      };
}
