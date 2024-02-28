import 'dart:convert';

import 'package:yc_app_utils/models/form_component/form_component_model.import.dart';

class OptionModel {
  String label;
  String value;
  bool? disabled;
  StyledInputFieldModel? inputField;

  OptionModel({
    required this.label,
    required this.value,
    this.disabled,
    this.inputField,
  });

  OptionModel copyWith({
    String? label,
    String? value,
    bool? disabled,
    StyledInputFieldModel? inputField,
  }) {
    return OptionModel(
      label: label ?? this.label,
      value: value ?? this.value,
      disabled: disabled ?? this.disabled,
      inputField: inputField ?? this.inputField,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'value': value,
      'disabled': disabled,
      'inputField': inputField,
    };
  }

  factory OptionModel.fromMap(Map<String, dynamic> map) {
    return OptionModel(
      label: map['label'] ?? '',
      value: map['value'] ?? '',
      disabled: map['disabled'] ?? false,
      inputField: map['inputField'] != null
          ? StyledInputFieldModel.fromMap(map['inputField'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OptionModel.fromJson(String source) =>
      OptionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OptionModel(label: $label, value: $value, disabled: $disabled, inputField: $inputField)';
  }

  @override
  bool operator ==(covariant OptionModel other) {
    if (identical(this, other)) return true;

    return other.label == label &&
        other.value == value &&
        other.disabled == disabled &&
        other.inputField == inputField;
  }

  @override
  int get hashCode {
    return label.hashCode ^
        value.hashCode ^
        disabled.hashCode ^
        inputField.hashCode;
  }
}
