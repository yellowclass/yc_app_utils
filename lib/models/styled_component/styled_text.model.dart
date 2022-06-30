import 'package:flutter/material.dart';

import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/image.model.dart';
import 'package:yc_app_utils/models/section_background/section_background.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_component_union.dart';
import 'package:yc_app_utils/ui/components/styled_text/styled_text_widget.dart';
import 'package:yc_app_utils/ui/text_styles/tstyle.enum.dart';

class StyledText with StyledComponentUnion {
  String text;
  String textColor;
  TStyle tStyle;
  int? textSize;
  int? textWeight;
  String? textFont;
  bool? italic;
  ImageModel? prefixIcon;
  ImageModel? suffixIcon;
  bool strikeThrough;
  TextAlign textAlign;
  String? backgroundColor;
  String? borderColor;
  int? borderRadius;
  List<int>? padding;
  SectionBackground? background;
  MainAxisAlignment? flexAlignment;

  StyledText({
    required this.text,
    this.tStyle = TStyle.B1_400,
    this.textColor = '',
    this.textSize,
    this.textWeight,
    this.textFont,
    this.italic,
    this.prefixIcon,
    this.suffixIcon,
    this.strikeThrough = false,
    this.textAlign = TextAlign.left,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.background,
    this.flexAlignment,
  });

  StyledText copyWith({
    String? text,
    String? textColor,
    TStyle? tStyle,
    int? textSize,
    int? textWeight,
    String? textFont,
    bool? italic,
    ImageModel? prefixIcon,
    ImageModel? suffixIcon,
    bool? strikeThrough,
    TextAlign? textAlign,
    String? backgroundColor,
    String? borderColor,
    int? borderRadius,
    List<int>? padding,
    SectionBackground? background,
    MainAxisAlignment? flexAlignment,
  }) {
    return StyledText(
      text: text ?? this.text,
      textColor: textColor ?? this.textColor,
      tStyle: tStyle ?? this.tStyle,
      textSize: textSize ?? this.textSize,
      textWeight: textWeight ?? this.textWeight,
      textFont: textFont ?? this.textFont,
      italic: italic ?? this.italic,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      strikeThrough: strikeThrough ?? this.strikeThrough,
      textAlign: textAlign ?? this.textAlign,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      background: background ?? this.background,
      flexAlignment: flexAlignment ?? this.flexAlignment,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'textColor': textColor,
      'tStyle': tStyle.name,
      'textSize': textSize,
      'textWeight': textWeight,
      'textFont': textFont,
      'italic': italic,
      'prefixIcon': prefixIcon?.toMap(),
      'suffixIcon': suffixIcon?.toMap(),
      'strikeThrough': strikeThrough,
      'textAlign': textAlign.name,
      'backgroundColor': backgroundColor,
      'borderColor': borderColor,
      'borderRadius': borderRadius,
      'padding': padding,
      'background': background?.toMap(),
      'flexAlignment': flexAlignment?.name,
    };
  }

  factory StyledText.fromMap(Map<String, dynamic> map) {
    return StyledText(
      text: map['text'] ?? "",
      textColor: map['textColor'] ?? "000000",
      tStyle: map['tStyle'] != null
          ? CommonHelpers.enumFromString<TStyle>(
                TStyle.values,
                map['tStyle'],
              ) ??
              TStyle.B1_400
          : TStyle.B1_400,
      textSize: map['textSize'],
      textWeight: map['textWeight'],
      textFont: map['textFont'],
      italic: map['italic'],
      prefixIcon: map['prefixIcon'] != null
          ? ImageModel.fromMap(map['prefixIcon'])
          : null,
      suffixIcon: map['suffixIcon'] != null
          ? ImageModel.fromMap(map['suffixIcon'])
          : null,
      strikeThrough: map['strikeThrough'] ?? false,
      textAlign: CommonHelpers.getTextAlignmentFromString(
        map['textAlign'],
      ),
      backgroundColor: map['backgroundColor'],
      borderColor: map['borderColor'],
      borderRadius: map['borderRadius'],
      padding:
          map['padding'] == null ? <int>[] : List<int>.from(map['padding']),
      background: map['background'] != null
          ? SectionBackground.fromMap(map['background'])
          : null,
      flexAlignment: map['flexAlignment'] != null
          ? CommonHelpers.getFlexAlignmentFromString(map['flexAlignment'])
          : MainAxisAlignment.start,
    );
  }

  factory StyledText.defaultObj() {
    return StyledText(
      text: "",
      textColor: "000000",
      tStyle: TStyle.B1_400,
    );
  }
}

extension StyledTextExt on StyledText {
  StyledTextWidget buildWidget({
    int? maxLines,
    TextOverflow? overflow,
    TextAlign? textAlign,
  }) {
    return StyledTextWidget(
      styledText: this,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
