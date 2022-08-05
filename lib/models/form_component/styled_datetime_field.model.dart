import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/form_component/form_component_union.model.dart';
import 'package:yc_app_utils/models/styled_component/v2_styled_text.model.dart';
import 'package:yc_app_utils/models/validation/validation.model.dart';

class StyledDateTimeFieldModel with FormComponentUnion {
  V2StyledTextModel? label;
  String name;
  Validation? validation;
  DateTimeFieldTypeEnum dateTimeFieldType;
  String? defaultDateTimeValue;
  String? inputDefaultValue;
  bool isDisabled;
  String? placeholder;
  String? firstDate;
  String? lastDate;

  StyledDateTimeFieldModel({
    this.label,
    required this.name,
    this.validation,
    required this.dateTimeFieldType,
    this.defaultDateTimeValue,
    this.inputDefaultValue,
    required this.isDisabled,
    this.placeholder,
    this.firstDate,
    this.lastDate,
  });

  StyledDateTimeFieldModel copyWith({
    V2StyledTextModel? label,
    String? name,
    Validation? validation,
    DateTimeFieldTypeEnum? dateTimeFieldType,
    String? defaultDateTimeValue,
    String? inputDefaultValue,
    bool? isDisabled,
    String? placeholder,
    String? firstDate,
    String? lastDate,
  }) {
    return StyledDateTimeFieldModel(
      label: label ?? this.label,
      name: name ?? this.name,
      validation: validation ?? this.validation,
      dateTimeFieldType: dateTimeFieldType ?? this.dateTimeFieldType,
      defaultDateTimeValue: defaultDateTimeValue ?? this.defaultDateTimeValue,
      inputDefaultValue: inputDefaultValue ?? this.inputDefaultValue,
      isDisabled: isDisabled ?? this.isDisabled,
      placeholder: placeholder ?? this.placeholder,
      firstDate: firstDate ?? this.firstDate,
      lastDate: lastDate ?? this.lastDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label?.toMap(),
      'name': name,
      'validation': validation?.toMap(),
      'dateTimeFieldType': dateTimeFieldType.name,
      'defaultDateTimeValue': defaultDateTimeValue,
      'inputDefaultValue': inputDefaultValue,
      'isDisabled': isDisabled,
      'placeholder': placeholder,
      'firstDate': firstDate,
      'lastDate': lastDate,
    };
  }

  factory StyledDateTimeFieldModel.fromMap(Map<String, dynamic> map) {
    return StyledDateTimeFieldModel(
      label:
          map['label'] != null ? V2StyledTextModel.fromMap(map['label']) : null,
      name: map['name'] ?? '',
      validation: map['validation'] != null
          ? Validation.fromMap(map['validation'])
          : null,
      dateTimeFieldType: CommonHelpers.enumFromString(
            DateTimeFieldTypeEnum.values,
            map['dateTimeFieldType'],
          ) ??
          DateTimeFieldTypeEnum.DATE,
      defaultDateTimeValue: map['defaultDateTimeValue'],
      inputDefaultValue: map['inputDefaultValue'],
      isDisabled: map['isDisabled'] ?? false,
      placeholder: map['placeholder'],
      firstDate: map['firstDate'],
      lastDate: map['lastDate'],
    );
  }
}

enum DateTimeFieldTypeEnum {
  DATE,
  TIME,
  DATETIME,
}
