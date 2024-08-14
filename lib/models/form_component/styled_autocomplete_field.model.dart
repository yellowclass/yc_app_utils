import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/autocomplete_suggestion/autocomplete_field_data.model.dart';
import 'package:yc_app_utils/models/form_component/form_component_union.model.dart';
import 'package:yc_app_utils/models/styled_component/v2_styled_text.model.dart';
import 'package:yc_app_utils/models/validation/validation.model.dart';

class StyledAutoCompleteFieldModel extends FormComponentUnion {
  String name;
  String autocompleteType;
  V2StyledTextModel? label;
  Validation? validation;
  AutocompleteFieldData? autocompleteDefaultValue;
  bool isDisabled;
  int maxLines;
  bool isExpanded;
  List<int>? padding;
  InputDecoration? inputDecoration;
  TextStyle? textStyle;
  double? optionsViewHeight;
  String? miscParams;

  StyledAutoCompleteFieldModel({
    required this.name,
    required this.autocompleteType,
    this.label,
    this.validation,
    this.autocompleteDefaultValue,
    this.isDisabled = false,
    this.maxLines = 0,
    this.isExpanded = false,
    this.padding,
    this.inputDecoration,
    this.textStyle,
    this.optionsViewHeight,
    this.miscParams,
  });

  StyledAutoCompleteFieldModel copyWith({
    String? name,
    V2StyledTextModel? label,
    Validation? validation,
    AutocompleteFieldData? autocompleteDefaultValue,
    bool? isDisabled,
    int? maxLines,
    bool? isExpanded,
    List<int>? padding,
    InputDecoration? inputDecoration,
    TextStyle? textStyle,
    double? optionsViewHeight,
    String? miscParams,
  }) {
    return StyledAutoCompleteFieldModel(
      name: name ?? this.name,
      autocompleteType: autocompleteType,
      label: label ?? this.label,
      validation: validation ?? this.validation,
      autocompleteDefaultValue:
          autocompleteDefaultValue ?? this.autocompleteDefaultValue,
      isDisabled: isDisabled ?? this.isDisabled,
      maxLines: maxLines ?? this.maxLines,
      isExpanded: isExpanded ?? this.isExpanded,
      padding: padding ?? this.padding,
      inputDecoration: inputDecoration ?? this.inputDecoration,
      textStyle: textStyle ?? this.textStyle,
      optionsViewHeight: optionsViewHeight ?? this.optionsViewHeight,
      miscParams: miscParams ?? this.miscParams,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'autocompleteType': autocompleteType,
      'label': label?.toMap(),
      'validation': validation?.toMap(),
      'autocompleteDefaultValue': autocompleteDefaultValue?.toMap(),
      'isDisabled': isDisabled,
      'maxLines': maxLines,
      'isExpanded': isExpanded,
      'padding': padding?.toString(),
      'inputDecoration': inputDecoration?.toString(),
      'textStyle': textStyle?.toString(),
      'optionsViewHeight': optionsViewHeight,
      'miscParams': miscParams,
    };
  }

  factory StyledAutoCompleteFieldModel.fromMap(Map<String, dynamic> map) {
    return StyledAutoCompleteFieldModel(
      name: map['name'] as String,
      autocompleteType: map['autocompleteType'] as String,
      label: map['label'] != null
          ? V2StyledTextModel.fromMap(map['label'] as Map<String, dynamic>)
          : null,
      validation: map['validation'] != null
          ? Validation.fromMap(map['validation'] as Map<String, dynamic>)
          : null,
      autocompleteDefaultValue: map['autocompleteDefaultValue'] != null
          ? AutocompleteFieldData.fromMap(
              map['autocompleteDefaultValue'] as Map<String, dynamic>)
          : null,
      isDisabled: map['isDisabled'] ?? false,
      maxLines: map['maxLines'],
      isExpanded: map['isExpanded'] ?? false,
      padding: map['padding'] != null
          ? List<int>.from(
              map['padding'],
            )
          : null,
      inputDecoration: map['inputDecoration'] != null
          ? CommonHelpers.getInputDecorationFromMap(map['inputDecoration'])
          : null,
      textStyle: map['textStyle'] != null
          ? CommonHelpers.getTextStyleFromV2StyledText(
              V2StyledTextModel.fromMap((map['textStyle'])),
            )
          : null,
      optionsViewHeight: map['optionsViewHeight']?.toDouble(),
      miscParams: map['miscParams'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StyledAutoCompleteFieldModel.fromJson(String source) =>
      StyledAutoCompleteFieldModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant StyledAutoCompleteFieldModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.autocompleteType == autocompleteType &&
        other.label == label &&
        other.validation == validation &&
        other.autocompleteDefaultValue == autocompleteDefaultValue &&
        other.isDisabled == isDisabled &&
        other.maxLines == maxLines &&
        other.isExpanded == isExpanded &&
        other.inputDecoration == inputDecoration &&
        other.textStyle == textStyle &&
        other.optionsViewHeight == optionsViewHeight &&
        other.miscParams == miscParams;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        autocompleteType.hashCode ^
        label.hashCode ^
        validation.hashCode ^
        autocompleteDefaultValue.hashCode ^
        isDisabled.hashCode ^
        maxLines.hashCode ^
        isExpanded.hashCode ^
        inputDecoration.hashCode ^
        textStyle.hashCode ^
        optionsViewHeight.hashCode ^
        miscParams.hashCode;
  }
}
