import 'package:yc_app_utils/models/styled_component/option.model.dart';
import 'package:yc_app_utils/models/styled_component/v2_styled_text.model.dart';
import 'package:yc_app_utils/models/validation/validation.model.dart';

class StyledRadioField {
  V2StyledText? label;
  String name;
  Validation? validate;
  String? defaultValue;
  bool isDisabled;
  List<Option> options;

  StyledRadioField({
    this.label,
    required this.name,
    this.validate,
    this.defaultValue,
    this.isDisabled = false,
    required this.options,
  });

  StyledRadioField copyWith({
    V2StyledText? label,
    String? name,
    Validation? validate,
    String? defaultValue,
    bool? isDisabled,
    List<Option>? options,
  }) {
    return StyledRadioField(
      label: label ?? this.label,
      name: name ?? this.name,
      validate: validate ?? this.validate,
      defaultValue: defaultValue ?? this.defaultValue,
      isDisabled: isDisabled ?? this.isDisabled,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label?.toMap(),
      'name': name,
      'validate': validate?.toMap(),
      'defaultValue': defaultValue,
      'isDisabled': isDisabled,
      'options': options.map((x) => x.toMap()).toList(),
    };
  }

  factory StyledRadioField.fromMap(Map<String, dynamic> map) {
    return StyledRadioField(
      label: map['label'] != null ? V2StyledText.fromMap(map['label']) : null,
      name: map['name'] ?? '',
      validate:
          map['validate'] != null ? Validation.fromMap(map['validate']) : null,
      defaultValue: map['defaultValue'],
      isDisabled: map['isDisabled'] ?? false,
      options: List<Option>.from(map['options']?.map((x) => Option.fromMap(x))),
    );
  }
}
