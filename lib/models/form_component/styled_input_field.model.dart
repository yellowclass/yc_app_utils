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
  String? defaultValue;
  bool isDisabled;
  int maxLines;

  StyledInputFieldModel({
    this.label,
    required this.name,
    this.inputFieldType,
    this.placeholder,
    this.validation,
    this.defaultValue,
    this.isDisabled = false,
    this.maxLines = 1,
  });

  StyledInputFieldModel copyWith({
    V2StyledTextModel? label,
    String? name,
    InputFieldEnum? inputFieldType,
    String? placeholder,
    Validation? validation,
    String? defaultValue,
    bool? isDisabled,
    int? maxLines,
  }) {
    return StyledInputFieldModel(
      label: label ?? this.label,
      name: name ?? this.name,
      inputFieldType: inputFieldType ?? this.inputFieldType,
      placeholder: placeholder ?? this.placeholder,
      validation: validation ?? this.validation,
      defaultValue: defaultValue ?? this.defaultValue,
      isDisabled: isDisabled ?? this.isDisabled,
      maxLines: maxLines ?? this.maxLines,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label?.toMap(),
      'name': name,
      'inputFieldType': inputFieldType?.name,
      'placeholder': placeholder,
      'validation': validation?.toMap(),
      'defaultValue': defaultValue,
      'isDisabled': isDisabled,
      'maxLines': maxLines,
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
      defaultValue: map['defaultValue'],
      isDisabled: map['isDisabled'] ?? false,
      maxLines: map['maxLines'] ?? 1,
    );
  }
}

enum InputFieldEnum {
  STRING,
  EMAIL,
  NUMBER,
  PASSWORD,
  MOBILE,
}
