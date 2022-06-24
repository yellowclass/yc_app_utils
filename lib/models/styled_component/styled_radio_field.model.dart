import 'package:yc_app_utils/models/styled_component/option.model.dart';
import 'package:yc_app_utils/models/styled_component/v2_styled_text.model.dart';
import 'package:yc_app_utils/models/validation/validation.model.dart';

class StyledRadioFieldModel {
  V2StyledTextModel? label;
  String name;
  Validation? validate;
  OptionModel? defaultValue;
  bool isDisabled;
  List<OptionModel> options;

  StyledRadioFieldModel({
    this.label,
    required this.name,
    this.validate,
    this.defaultValue,
    this.isDisabled = false,
    required this.options,
  });

  StyledRadioFieldModel copyWith({
    V2StyledTextModel? label,
    String? name,
    Validation? validate,
    OptionModel? defaultValue,
    bool? isDisabled,
    List<OptionModel>? options,
  }) {
    return StyledRadioFieldModel(
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

  factory StyledRadioFieldModel.fromMap(Map<String, dynamic> map) {
    return StyledRadioFieldModel(
      label:
          map['label'] != null ? V2StyledTextModel.fromMap(map['label']) : null,
      name: map['name'] ?? '',
      validate:
          map['validate'] != null ? Validation.fromMap(map['validate']) : null,
      defaultValue: map['defaultValue'] != null
          ? OptionModel.fromMap(map['defaultValue'])
          : null,
      isDisabled: map['isDisabled'] ?? false,
      options: List<OptionModel>.from(
          map['options']?.map((x) => OptionModel.fromMap(x))),
    );
  }
}
