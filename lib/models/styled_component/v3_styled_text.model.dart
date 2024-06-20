import 'package:flutter/material.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class V3StyledTextModel extends StyledComponentUnion {
  final List<V2StyledTextModel> texts;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final int? maxLines;
  final EdgeInsetsGeometry? padding;
  final SectionBackground? background;

  V3StyledTextModel({
    required this.texts,
    this.maxLines,
    this.textAlign,
    this.textOverflow,
    this.padding,
    this.background,
  });

  factory V3StyledTextModel.fromMap(Map<String, dynamic> map) {
    return V3StyledTextModel(
      texts: List.from(map["texts"].map((e) => V2StyledTextModel.fromMap(e))),
      textAlign: map['textAlign'] != null
          ? CommonHelpers.getTextAlignmentFromString(
              map['textAlign'],
            )
          : null,
      textOverflow: map['textOverflow'] != null
          ? CommonHelpers.getTextOverflowFromString(
              map['textOverflow'],
            )
          : null,
      padding: map['padding'] != null
          ? CommonHelpers.getPaddingFromList(
              List.from(List<int>.from(map['padding'])))
          : null,
      background: map['background'] != null
          ? SectionBackground.fromMap(map['background'])
          : null,
    );
  }
}
