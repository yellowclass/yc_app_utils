import 'package:flutter/material.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class StyledCircularProgress with StyledComponentUnion {
  int? radius;
  int? width;
  Color? activeColor;
  Color? inactiveColor;
  List<V2StyledTextModel>? innerText;
  StyledImageModel? bottomIcon;

  StyledCircularProgress({
    this.radius,
    this.width,
    this.activeColor,
    this.inactiveColor,
    this.innerText,
    this.bottomIcon,
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
          innerText == other.innerText &&
          bottomIcon == other.bottomIcon);

  @override
  int get hashCode =>
      radius.hashCode ^
      width.hashCode ^
      activeColor.hashCode ^
      inactiveColor.hashCode ^
      innerText.hashCode ^
      bottomIcon.hashCode;

  @override
  String toString() {
    return 'StyledCircularProgress{' +
        ' radius: $radius,' +
        ' width: $width,' +
        ' activeColor: $activeColor,' +
        ' inactiveColor: $inactiveColor,' +
        ' innerText: $innerText,' +
        ' bottomIcon: $bottomIcon,' +
        '}';
  }

  StyledCircularProgress copyWith({
    int? radius,
    int? width,
    Color? activeColor,
    Color? inactiveColor,
    List<V2StyledTextModel>? innerText,
    StyledImageModel? bottomIcon,
  }) {
    return StyledCircularProgress(
      radius: radius ?? this.radius,
      width: width ?? this.width,
      activeColor: activeColor ?? this.activeColor,
      inactiveColor: inactiveColor ?? this.inactiveColor,
      innerText: innerText ?? this.innerText,
      bottomIcon: bottomIcon ?? this.bottomIcon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'radius': this.radius,
      'width': this.width,
      'activeColor': this.activeColor?.toString(),
      'inactiveColor': this.inactiveColor?.toString(),
      'innerText': this.innerText?.toString(),
      'bottomIcon': this.bottomIcon?.toString(),
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
      innerText: map['innerText'] != null
          ? List<V2StyledTextModel>.from(
              map['innerText'].map((e) => V2StyledTextModel.fromMap(e)))
          : null,
      bottomIcon: map['bottomIcon'] != null
          ? StyledImageModel.fromMap(map['bottomIcon'])
          : null,
    );
  }
}
