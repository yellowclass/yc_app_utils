import 'package:flutter/material.dart';

import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/section_background/section_background.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_component_union.dart';
import 'package:yc_app_utils/ui/text_styles/tstyle.enum.dart';

class V2StyledTextModel with StyledComponentUnion {
  String text;
  String? textColor;
  TStyle? tStyle;
  bool? italic;
  double? letterSpacing;
  bool strikeThrough;
  TextAlign? textAlign;
  TextOverflow? textOverflow;
  int? maxLines;
  SectionBackground? background;
  String? borderColor;
  List<int>? borderRadius;
  List<int>? padding;

  V2StyledTextModel({
    required this.text,
    this.textColor = '#212A39',
    this.tStyle,
    this.italic,
    this.letterSpacing,
    this.strikeThrough = false,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.background,
    this.borderColor,
    this.borderRadius,
    this.padding,
  });

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'textColor': textColor,
      'tStyle': tStyle?.name,
      'italic': italic,
      'letterSpacing': letterSpacing,
      'strikeThrough': strikeThrough,
      'textAlign': textAlign?.name,
      'textOverflow': textOverflow?.name,
      'maxLines': maxLines,
      'background': background?.toMap(),
      'borderColor': borderColor,
      'borderRadius': borderRadius,
      'padding': padding,
    };
  }

  factory V2StyledTextModel.fromMap(Map<String, dynamic> map) {
    return V2StyledTextModel(
      text: map['text'] ?? '',
      textColor: map['textColor'] ?? '#212A39',
      tStyle: map['tStyle'] != null
          ? CommonHelpers.enumFromString(
              TStyle.values,
              map['tStyle'],
            )
          : null,
      italic: map['italic'],
      letterSpacing: map['letterSpacing'],
      strikeThrough: map['strikeThrough'] ?? false,
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
      maxLines: map['maxLines'],
      background: map['background'] != null
          ? SectionBackground.fromMap(map['background'])
          : null,
      borderColor: map['borderColor'],
      borderRadius: map['borderRadius'] == null
          ? <int>[]
          : List<int>.from(map['borderRadius']),
      padding:
          map['padding'] == null ? <int>[] : List<int>.from(map['padding']),
    );
  }
}
