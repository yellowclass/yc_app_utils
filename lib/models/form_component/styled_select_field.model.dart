import 'package:flutter/material.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class StyledSelectFieldModel with FormComponentUnion {
  V2StyledTextModel? label;
  String name;
  Validation? validation;
  List<OptionModel>? selectDefaultValue;
  bool isDisabled;
  List<OptionModel> options;
  SelectType selectType;
  bool isSearchable;
  String? placeholder;
  InputDecoration? inputDecoration;
  TextStyle? textStyle;
  List<ImageModel>? dropdownIcon;
  String? hintText;
  String? leadingIcon;

  StyledSelectFieldModel({
    this.label,
    required this.name,
    this.validation,
    this.selectDefaultValue,
    this.isDisabled = false,
    required this.options,
    this.selectType = SelectType.SINGLE,
    this.isSearchable = false,
    this.placeholder,
    this.inputDecoration,
    this.textStyle,
    this.dropdownIcon,
    this.hintText,
    this.leadingIcon,
  });

  StyledSelectFieldModel copyWith({
    V2StyledTextModel? label,
    String? name,
    Validation? validation,
    List<OptionModel>? selectDefaultValue,
    bool? isDisabled,
    List<OptionModel>? options,
    SelectType? selectType,
    bool? isSearchable,
    String? placeholder,
    InputDecoration? inputDecoration,
    TextStyle? textStyle,
    List<ImageModel>? dropdownIcon,
    String? hintText,
    String? leadingIcon,
  }) {
    return StyledSelectFieldModel(
      label: label ?? this.label,
      name: name ?? this.name,
      validation: validation ?? this.validation,
      selectDefaultValue: selectDefaultValue ?? this.selectDefaultValue,
      isDisabled: isDisabled ?? this.isDisabled,
      options: options ?? this.options,
      selectType: selectType ?? this.selectType,
      isSearchable: isSearchable ?? this.isSearchable,
      placeholder: placeholder ?? this.placeholder,
      inputDecoration: inputDecoration ?? this.inputDecoration,
      textStyle: textStyle ?? this.textStyle,
      dropdownIcon: dropdownIcon ?? this.dropdownIcon,
      hintText: hintText ?? this.hintText,
      leadingIcon: leadingIcon ?? this.leadingIcon,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label?.toMap(),
      'name': name,
      'validation': validation?.toMap(),
      'selectDefaultValue': selectDefaultValue,
      'isDisabled': isDisabled,
      'options': options.map((x) => x.toMap()).toList(),
      'selectType': selectType.name,
      'isSearchable': isSearchable,
      'placeholder': placeholder,
      'inputDecoration': inputDecoration,
      'textStyle': textStyle,
      'dropdownIcon': dropdownIcon,
      'hintText': hintText,
      'leadingIcon': leadingIcon,
    };
  }

  factory StyledSelectFieldModel.fromMap(Map<String, dynamic> map) {
    return StyledSelectFieldModel(
      label:
          map['label'] != null ? V2StyledTextModel.fromMap(map['label']) : null,
      name: map['name'] ?? '',
      validation: map['validation'] != null
          ? Validation.fromMap(map['validation'])
          : null,
      selectDefaultValue: map['selectDefaultValue'] != null
          ? List<OptionModel>.from(
              map['selectDefaultValue']?.map((x) => OptionModel.fromMap(x)))
          : null,
      isDisabled: map['isDisabled'] ?? false,
      options: List<OptionModel>.from(
          map['options']?.map((x) => OptionModel.fromMap(x))),
      selectType: CommonHelpers.enumFromString(
            SelectType.values,
            map['selectType'],
          ) ??
          SelectType.SINGLE,
      isSearchable: map['isSearchable'] ?? false,
      placeholder: map['placeholder'],
      inputDecoration: map['inputDecoration'] != null
          ? CommonHelpers.getInputDecorationFromMap(map['inputDecoration'])
          : null,
      textStyle: map['textStyle'] != null
          ? CommonHelpers.getTextStyleFromV2StyledText(
              V2StyledTextModel.fromMap((map['textStyle'])),
            )
          : null,
      dropdownIcon: map['dropdownIcon'] != null
          ? List<ImageModel>.from(
              map['dropdownIcon']?.map((x) => ImageModel.fromMap(x)))
          : null,
      hintText: map['hintText'],
      leadingIcon: map['leadingIcon'],
    );
  }
}
