import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/styled_component/v2_styled_text.model.dart';
import 'package:yc_app_utils/models/validation/validation.model.dart';

class StyledInputField {
  V2StyledText? label;
  String name;
  InputFieldEnum? type;
  String? placeholder;
  Validation? validate;
  String? defaultValue;
  bool isDisabled;

  StyledInputField({
    this.label,
    required this.name,
    this.type,
    this.placeholder,
    this.validate,
    this.defaultValue,
    this.isDisabled = false,
  });

  StyledInputField copyWith({
    V2StyledText? label,
    String? name,
    InputFieldEnum? type,
    String? placeholder,
    Validation? validate,
    String? defaultValue,
    bool? isDisabled,
  }) {
    return StyledInputField(
      label: label ?? this.label,
      name: name ?? this.name,
      type: type ?? this.type,
      placeholder: placeholder ?? this.placeholder,
      validate: validate ?? this.validate,
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
      'validate': validate?.toMap(),
      'defaultValue': defaultValue,
      'isDisabled': isDisabled,
    };
  }

  factory StyledInputField.fromMap(Map<String, dynamic> map) {
    return StyledInputField(
      label: map['label'] != null ? V2StyledText.fromMap(map['label']) : null,
      name: map['name'] ?? '',
      type: map['type'] != null
          ? CommonHelpers.enumFromString(
              InputFieldEnum.values,
              map['type'],
            )
          : null,
      placeholder: map['placeholder'],
      validate:
          map['validate'] != null ? Validation.fromMap(map['validate']) : null,
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
