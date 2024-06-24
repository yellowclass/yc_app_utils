import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/form_component/form_component_union.model.dart';
import 'package:yc_app_utils/models/styled_component/v2_styled_text.model.dart';
import 'package:yc_app_utils/models/validation/validation.model.dart';

class StyledInputFieldModel with FormComponentUnion {
  V2StyledTextModel? label;
  String name;
  InputFieldEnum? inputFieldType;
  String? placeholder;
  Validation? validation;
  String? inputDefaultValue;
  bool isDisabled;
  int maxLines;
  bool isExpanded;
  bool maxCounterVisible;
  bool showUnderline;
  String? borderColor;
  List<int>? borderRadius;
  List<int>? padding;
  InputDecoration? inputDecoration;
  TextStyle? textStyle;
  String? countryCode;
  TextAlign? textAlign;

  StyledInputFieldModel({
    this.label,
    required this.name,
    this.inputFieldType,
    this.placeholder,
    this.validation,
    this.inputDefaultValue,
    this.isDisabled = false,
    this.maxLines = 1,
    this.isExpanded = false,
    this.maxCounterVisible = false,
    this.showUnderline = true,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.inputDecoration,
    this.textStyle,
    this.countryCode,
    this.textAlign,
  });

  StyledInputFieldModel copyWith({
    V2StyledTextModel? label,
    String? name,
    InputFieldEnum? inputFieldType,
    String? placeholder,
    Validation? validation,
    String? inputDefaultValue,
    bool? isDisabled,
    int? maxLines,
    bool? isExpanded,
    bool? maxCounterVisible,
    bool? showUnderline,
    String? borderColor,
    List<int>? borderRadius,
    List<int>? padding,
    InputDecoration? inputDecoration,
    TextStyle? textStyle,
    TextAlign? textAlign,
  }) {
    return StyledInputFieldModel(
      label: label ?? this.label,
      name: name ?? this.name,
      inputFieldType: inputFieldType ?? this.inputFieldType,
      placeholder: placeholder ?? this.placeholder,
      validation: validation ?? this.validation,
      inputDefaultValue: inputDefaultValue ?? this.inputDefaultValue,
      isDisabled: isDisabled ?? this.isDisabled,
      maxLines: maxLines ?? this.maxLines,
      isExpanded: isExpanded ?? this.isExpanded,
      maxCounterVisible: maxCounterVisible ?? this.maxCounterVisible,
      showUnderline: showUnderline ?? this.showUnderline,
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      inputDecoration: inputDecoration ?? this.inputDecoration,
      textStyle: textStyle ?? this.textStyle,
      countryCode: countryCode ?? this.countryCode,
      textAlign: textAlign ?? this.textAlign,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label?.toMap(),
      'name': name,
      'inputFieldType': inputFieldType?.name,
      'placeholder': placeholder,
      'validation': validation?.toMap(),
      'inputDefaultValue': inputDefaultValue,
      'isDisabled': isDisabled,
      'maxLines': maxLines,
      'isExpanded': isExpanded,
      'maxCounterVisible': maxCounterVisible,
      'showUnderline': showUnderline,
      'borderColor': borderColor,
      'borderRadius': borderRadius,
      'padding': padding,
      'inputDecoration': inputDecoration?.toString(),
      'textStyle': textStyle?.toString(),
      'countryCode': countryCode,
      'textAlign': textAlign?.toString(),
    };
  }

  factory StyledInputFieldModel.fromMap(Map<String, dynamic> map) {
    return StyledInputFieldModel(
      label:
          map['label'] != null ? V2StyledTextModel.fromMap(map['label']) : null,
      name: map['name'] ?? '',
      inputFieldType: map['inputFieldType'] != null
          ? CommonHelpers.enumFromString(
              InputFieldEnum.values,
              map['inputFieldType'],
            )
          : null,
      placeholder: map['placeholder'],
      validation: map['validation'] != null
          ? Validation.fromMap(map['validation'])
          : null,
      inputDefaultValue: map['inputDefaultValue'],
      isDisabled: map['isDisabled'] ?? false,
      maxLines: map['maxLines'] ?? 1,
      isExpanded: map['isExpanded'] ?? false,
      maxCounterVisible: map['maxCounterVisible'] ?? false,
      showUnderline: map['showUnderline'] ?? true,
      borderColor: map['borderColor'],
      borderRadius: map['borderRadius'] == null
          ? <int>[]
          : List<int>.from(map['borderRadius']),
      padding:
          map['padding'] == null ? <int>[] : List<int>.from(map['padding']),
      inputDecoration: map['inputDecoration'] != null
          ? CommonHelpers.getInputDecorationFromMap(map['inputDecoration'])
          : null,
      textStyle: map['textStyle'] != null
          ? CommonHelpers.getTextStyleFromV2StyledText(
              V2StyledTextModel.fromMap((map['textStyle'])),
            )
          : null,
      countryCode: map['countryCode'],
      textAlign: map['textAlign'] != null
          ? CommonHelpers.getTextAlignmentFromString(map['textAlign'])
          : null,
    );
  }
}

enum InputFieldEnum {
  TEXT,
  EMAIL,
  NUMBER,
  PASSWORD,
  MOBILE,
}
