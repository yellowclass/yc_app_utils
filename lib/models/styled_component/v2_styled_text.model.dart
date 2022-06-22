import 'package:flutter/material.dart';

import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/ui/text_styles/tstyle.enum.dart';

class V2StyledTextModel {
  String? text;
  String? textColor;
  TStyle? tStyle;
  bool? italic;
  bool strikeThrough;
  TextAlign? textAlign;
  String? borderColor;

  V2StyledTextModel({
    this.text,
    this.textColor,
    this.tStyle,
    this.italic,
    required this.strikeThrough,
    this.textAlign,
    this.borderColor,
  });

  V2StyledTextModel copyWith({
    String? text,
    String? textColor,
    TStyle? tStyle,
    bool? italic,
    bool? strikeThrough,
    TextAlign? textAlign,
    String? borderColor,
  }) {
    return V2StyledTextModel(
      text: text ?? this.text,
      textColor: textColor ?? this.textColor,
      tStyle: tStyle ?? this.tStyle,
      italic: italic ?? this.italic,
      strikeThrough: strikeThrough ?? this.strikeThrough,
      textAlign: textAlign ?? this.textAlign,
      borderColor: borderColor ?? this.borderColor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'textColor': textColor,
      'tStyle': tStyle?.name,
      'italic': italic,
      'strikeThrough': strikeThrough,
      'textAlign': textAlign?.name,
      'borderColor': borderColor,
    };
  }

  factory V2StyledTextModel.fromMap(Map<String, dynamic> map) {
    return V2StyledTextModel(
      text: map['text'],
      textColor: map['textColor'],
      tStyle: map['tStyle'] != null
          ? CommonHelpers.enumFromString(
              TStyle.values,
              map['tStyle'],
            )
          : null,
      italic: map['italic'],
      strikeThrough: map['strikeThrough'] ?? false,
      textAlign: map['textAlign'] != null
          ? CommonHelpers.enumFromString(
              TextAlign.values,
              map['textAlign'],
            )
          : null,
      borderColor: map['borderColor'],
    );
  }
}
