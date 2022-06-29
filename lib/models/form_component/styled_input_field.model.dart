import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/form_component/form_component_union.model.dart';
import 'package:yc_app_utils/models/styled_component/v2_styled_text.model.dart';
import 'package:yc_app_utils/models/validation/validation.model.dart';

class StyledInputFieldModel with FormComponentUnion {
  V2StyledTextModel? label;
  String name;
  InputFieldEnum? type;
  String? placeholder;
  Validation? validation;
  String? defaultValue;
  bool isDisabled;

  StyledInputFieldModel({
    this.label,
    required this.name,
    this.type,
    this.placeholder,
    this.validation,
    this.defaultValue,
    this.isDisabled = false,
  });

  StyledInputFieldModel copyWith({
    V2StyledTextModel? label,
    String? name,
    InputFieldEnum? type,
    String? placeholder,
    Validation? validation,
    String? defaultValue,
    bool? isDisabled,
  }) {
    return StyledInputFieldModel(
      label: label ?? this.label,
      name: name ?? this.name,
      type: type ?? this.type,
      placeholder: placeholder ?? this.placeholder,
      validation: validation ?? this.validation,
      defaultValue: defaultValue ?? this.defaultValue,
      isDisabled: isDisabled ?? this.isDisabled,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label?.toMap(),
      'name': name,
      'type': type?.name,
      'placeholder': placeholder,
      'validation': validation?.toMap(),
      'defaultValue': defaultValue,
      'isDisabled': isDisabled,
    };
  }

  factory StyledInputFieldModel.fromMap(Map<String, dynamic> map) {
    return StyledInputFieldModel(
      label:
          map['label'] != null ? V2StyledTextModel.fromMap(map['label']) : null,
      name: map['name'] ?? '',
      type: map['type'] != null
          ? CommonHelpers.enumFromString(
              InputFieldEnum.values,
              map['type'],
            )
          : null,
      placeholder: map['placeholder'],
      validation: map['validation'] != null
          ? Validation.fromMap(map['validation'])
          : null,
      defaultValue: map['defaultValue'],
      isDisabled: map['isDisabled'] ?? false,
    );
  }
}

enum InputFieldEnum {
  STRING,
  EMAIL,
  NUMBER,
  PASSWORD,
}
