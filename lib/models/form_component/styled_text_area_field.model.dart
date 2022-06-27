import 'package:yc_app_utils/models/styled_component/v2_styled_text.model.dart';
import 'package:yc_app_utils/models/validation/validation.model.dart';

class StyledTextAreaFieldModel {
  V2StyledTextModel? label;
  String name;
  String? placeholder;
  Validation? validate;
  String? defaultValue;
  bool isDisabled;

  StyledTextAreaFieldModel({
    this.label,
    required this.name,
    this.placeholder,
    this.validate,
    this.defaultValue,
    this.isDisabled = false,
  });

  StyledTextAreaFieldModel copyWith({
    V2StyledTextModel? label,
    String? name,
    String? placeholder,
    Validation? validate,
    String? defaultValue,
    bool? isDisabled,
  }) {
    return StyledTextAreaFieldModel(
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

  factory StyledTextAreaFieldModel.fromMap(Map<String, dynamic> map) {
    return StyledTextAreaFieldModel(
      label:
          map['label'] != null ? V2StyledTextModel.fromMap(map['label']) : null,
      name: map['name'] ?? '',
      placeholder: map['placeholder'],
      validate:
          map['validate'] != null ? Validation.fromMap(map['validate']) : null,
      defaultValue: map['defaultValue'],
      isDisabled: map['isDisabled'] ?? false,
    );
  }
}
