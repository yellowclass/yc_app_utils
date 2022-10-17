import 'package:flutter/material.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class V2TextStyle {
  String? textColor;
  TStyle? tStyle;
  bool? italic;
  double? letterSpacing;
  bool? strikeThrough;
  TextAlign? textAlign;
  TextOverflow? textOverflow;
  int? maxLines;
  SectionBackground? background;
  String? borderColor;
  List<int>? borderRadius;
  List<int>? padding;
  bool? underline;

  V2TextStyle({
    this.textColor,
    this.tStyle,
    this.italic,
    this.letterSpacing,
    this.strikeThrough,
    this.textAlign,
    this.textOverflow,
    this.maxLines,
    this.background,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.underline,
  });

  V2TextStyle copyWith({
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
  }) {
    return V2TextStyle(
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
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'textColor': textColor,
      'tStyle': tStyle,
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
    };
  }

  factory V2TextStyle.fromMap(Map<String, dynamic> map) {
    return V2TextStyle(
      textColor: map['textColor'],
      tStyle: map['tStyle'] != null
          ? CommonHelpers.enumFromString(
              TStyle.values,
              map['tStyle'],
            )
          : null,
      italic: map['italic'],
      letterSpacing: map['letterSpacing'],
      strikeThrough: map['strikeThrough'],
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
      underline: map['underline'],
    );
  }
}
