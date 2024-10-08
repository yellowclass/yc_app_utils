import 'package:flutter/material.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class StyledCircularProgress extends StyledComponentUnion {
  int? radius;
  int? width;
  Color? activeColor;
  Color? inactiveColor;
  List<V2StyledTextModel>? innerTexts;
  StyledImageModel? bottomIcon;
  int? percentage;

  StyledCircularProgress({
    this.radius,
    this.width,
    this.activeColor,
    this.inactiveColor,
    this.innerTexts,
    this.bottomIcon,
    this.percentage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StyledCircularProgress &&
          runtimeType == other.runtimeType &&
          radius == other.radius &&
          width == other.width &&
          activeColor == other.activeColor &&
          inactiveColor == other.inactiveColor &&
          innerTexts == other.innerTexts &&
          bottomIcon == other.bottomIcon &&
          percentage == other.percentage);

  @override
  int get hashCode =>
      radius.hashCode ^
      width.hashCode ^
      activeColor.hashCode ^
      inactiveColor.hashCode ^
      innerTexts.hashCode ^
      bottomIcon.hashCode ^
      percentage.hashCode;

  @override
  String toString() {
    return 'StyledCircularProgress{' +
        ' radius: $radius,' +
        ' width: $width,' +
        ' activeColor: $activeColor,' +
        ' inactiveColor: $inactiveColor,' +
        ' innerTexts: $innerTexts,' +
        ' bottomIcon: $bottomIcon,' +
        ' percentage: $percentage' +
        '}';
  }

  StyledCircularProgress copyWith({
    int? radius,
    int? width,
    Color? activeColor,
    Color? inactiveColor,
    List<V2StyledTextModel>? innerTexts,
    StyledImageModel? bottomIcon,
    int? percentage,
  }) {
    return StyledCircularProgress(
      radius: radius ?? this.radius,
      width: width ?? this.width,
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      innerTexts: innerTexts ?? this.innerTexts,
      bottomIcon: bottomIcon ?? this.bottomIcon,
      percentage: percentage ?? this.percentage,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'radius': this.radius,
      'width': this.width,
      'activeColor': this.activeColor?.toString(),
      'inactiveColor': this.inactiveColor?.toString(),
      'innerText': this.innerTexts?.toString(),
      'bottomIcon': this.bottomIcon?.toString(),
      'percentage': this.percentage,
    };
  }

  factory StyledCircularProgress.fromMap(Map<String, dynamic> map) {
    return StyledCircularProgress(
      radius: map['radius'],
      width: map['width'],
      activeColor: map['activeColor'] != null
          ? CommonHelpers.v2ColorFromHex(map['activeColor'])
          : null,
      inactiveColor: map['inactiveColor'] != null
          ? CommonHelpers.v2ColorFromHex(map['inactiveColor'])
          : null,
      innerTexts: map['innerTexts'] != null
          ? List<V2StyledTextModel>.from(
              map['innerTexts'].map((e) => V2StyledTextModel.fromMap(e)))
          : null,
      bottomIcon: map['bottomIcon'] != null
          ? StyledImageModel.fromMap(map['bottomIcon'])
          : null,
      percentage: map['percentage'],
    );
  }
}
