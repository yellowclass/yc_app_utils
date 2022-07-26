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
  String? inputDefaultValue;
  bool isDisabled;
  int maxLines;
  bool isExpanded;
  bool maxCounterVisible;

  StyledInputFieldModel({
    this.label,
    required this.name,
    this.inputFieldType,
    this.placeholder,
    this.validation,
    this.inputDefaultValue,
    this.isDisabled = false,
    this.maxLines = 1,
    this.isExpanded = false,
    this.maxCounterVisible = false,
  });

  StyledInputFieldModel copyWith({
    V2StyledTextModel? label,
    String? name,
    InputFieldEnum? inputFieldType,
    String? placeholder,
    Validation? validation,
    String? inputDefaultValue,
    bool? isDisabled,
    int? maxLines,
    bool? isExpanded,
    bool? maxCounterVisible,
  }) {
    return StyledInputFieldModel(
      label: label ?? this.label,
      name: name ?? this.name,
      inputFieldType: inputFieldType ?? this.inputFieldType,
      placeholder: placeholder ?? this.placeholder,
      validation: validation ?? this.validation,
      inputDefaultValue: inputDefaultValue ?? this.inputDefaultValue,
      isDisabled: isDisabled ?? this.isDisabled,
      maxLines: maxLines ?? this.maxLines,
      isExpanded: isExpanded ?? this.isExpanded,
      maxCounterVisible: maxCounterVisible ?? this.maxCounterVisible,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label?.toMap(),
      'name': name,
      'inputFieldType': inputFieldType?.name,
      'placeholder': placeholder,
      'validation': validation?.toMap(),
      'inputDefaultValue': inputDefaultValue,
      'isDisabled': isDisabled,
      'maxLines': maxLines,
      'isExpanded': isExpanded,
      'maxCounterVisible': maxCounterVisible,
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
      inputDefaultValue: map['inputDefaultValue'],
      isDisabled: map['isDisabled'] ?? false,
      maxLines: map['maxLines'] ?? 1,
      isExpanded: map['isExpanded'] ?? false,
      maxCounterVisible: map['maxCounterVisible'] ?? false,
    );
  }
}

enum InputFieldEnum {
  TEXT,
  EMAIL,
  NUMBER,
  PASSWORD,
  MOBILE,
}
