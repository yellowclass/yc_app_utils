import 'package:yc_app_utils/models/styled_component/v2_styled_text.model.dart';
import 'package:yc_app_utils/models/validation/validation.model.dart';

class StyledTextAreaField {
  V2StyledText? label;
  String name;
  String? placeholder;
  Validation? validate;
  String? defaultValue;
  bool isDisabled;

  StyledTextAreaField({
    this.label,
    required this.name,
    this.placeholder,
    this.validate,
    this.defaultValue,
    this.isDisabled = false,
  });

  StyledTextAreaField copyWith({
    V2StyledText? label,
    String? name,
    String? placeholder,
    Validation? validate,
    String? defaultValue,
    bool? isDisabled,
  }) {
    return StyledTextAreaField(
      label: label ?? this.label,
      name: name ?? this.name,
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
      'placeholder': placeholder,
      'validate': validate?.toMap(),
      'defaultValue': defaultValue,
      'isDisabled': isDisabled,
    };
  }

  factory StyledTextAreaField.fromMap(Map<String, dynamic> map) {
    return StyledTextAreaField(
      label: map['label'] != null ? V2StyledText.fromMap(map['label']) : null,
      name: map['name'] ?? '',
      placeholder: map['placeholder'],
      validate:
          map['validate'] != null ? Validation.fromMap(map['validate']) : null,
      defaultValue: map['defaultValue'],
      isDisabled: map['isDisabled'] ?? false,
    );
  }
}
