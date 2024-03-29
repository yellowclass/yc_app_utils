import 'package:flutter/material.dart';

import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/section_background/section_background.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_component_union.dart';
import 'package:yc_app_utils/models/v2_text_style.model.dart';
import 'package:yc_app_utils/ui/text_styles/tstyle.enum.dart';

class V2StyledTextModel with StyledComponentUnion {
  static const String _defaultTextColor = '#212A39';
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
  bool underline;
  String? fontFamily;

  V2StyledTextModel({
    required this.text,
    this.textColor = _defaultTextColor,
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
    this.underline = false,
    this.fontFamily,
  });

  V2StyledTextModel copyWith({
    String? text,
    String? textColor,
    TStyle? tStyle,
    bool? italic,
    double? letterSpacing,
    bool? strikeThrough,
    TextAlign? textAlign,
    TextOverflow? textOverflow,
    int? maxLines,
    SectionBackground? background,
    String? borderColor,
    List<int>? borderRadius,
    List<int>? padding,
    bool? underline,
    String? fontFamily,
  }) {
    return V2StyledTextModel(
      text: text ?? this.text,
      textColor: textColor ?? this.textColor,
      tStyle: tStyle ?? this.tStyle,
      italic: italic ?? this.italic,
      letterSpacing: letterSpacing ?? this.letterSpacing,
      strikeThrough: strikeThrough ?? this.strikeThrough,
      textAlign: textAlign ?? this.textAlign,
      textOverflow: textOverflow ?? this.textOverflow,
      maxLines: maxLines ?? this.maxLines,
      background: background ?? this.background,
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      underline: underline ?? this.underline,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }

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
      'underline': underline,
      'fontFamily': fontFamily,
    };
  }

  factory V2StyledTextModel.fromMap(Map<String, dynamic> map) {
    return V2StyledTextModel(
      text: map['text'] ?? '',
      textColor: map['textColor'] ?? _defaultTextColor,
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
      underline: map['underline'] ?? false,
      fontFamily: map['fontFamily'],
    );
  }

  factory V2StyledTextModel.fromTextStyle({
    required String text,
    required V2TextStyle textStyle,
  }) {
    return V2StyledTextModel(
      text: text,
      borderColor: textStyle.borderColor,
      background: textStyle.background,
      borderRadius: textStyle.borderRadius,
      italic: textStyle.italic,
      letterSpacing: textStyle.letterSpacing,
      maxLines: textStyle.maxLines,
      padding: textStyle.padding,
      strikeThrough: textStyle.strikeThrough,
      textAlign: textStyle.textAlign,
      textColor: textStyle.textColor,
      textOverflow: textStyle.textOverflow,
      tStyle: textStyle.tStyle,
      underline: textStyle.underline,
      fontFamily: textStyle.fontFamily,
    );
  }
}
