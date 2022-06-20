import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/styled_component/option.model.dart';
import 'package:yc_app_utils/models/styled_component/select_type.enum.dart';
import 'package:yc_app_utils/models/styled_component/v2_styled_text.model.dart';
import 'package:yc_app_utils/models/validation/validation.model.dart';

class StyledSelectField {
  V2StyledText? label;
  String name;
  Validation? validate;
  List<Option>? defaultValue;
  bool isDisabled;
  List<Option> options;
  SelectType selectType;
  bool isSearchable;

  StyledSelectField({
    this.label,
    required this.name,
    this.validate,
    this.defaultValue,
    this.isDisabled = false,
    required this.options,
    this.selectType = SelectType.SINGLE,
    this.isSearchable = false,
  });

  StyledSelectField copyWith({
    V2StyledText? label,
    String? name,
    Validation? validate,
    List<Option>? defaultValue,
    bool? isDisabled,
    List<Option>? options,
    SelectType? selectType,
    bool? isSearchable,
  }) {
    return StyledSelectField(
      label: label ?? this.label,
      name: name ?? this.name,
      validate: validate ?? this.validate,
      defaultValue: defaultValue ?? this.defaultValue,
      isDisabled: isDisabled ?? this.isDisabled,
      options: options ?? this.options,
      selectType: selectType ?? this.selectType,
      isSearchable: isSearchable ?? this.isSearchable,
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
      'selectType': selectType.name,
      'isSearchable': isSearchable,
    };
  }

  factory StyledSelectField.fromMap(Map<String, dynamic> map) {
    return StyledSelectField(
      label: map['label'] != null ? V2StyledText.fromMap(map['label']) : null,
      name: map['name'] ?? '',
      validate:
          map['validate'] != null ? Validation.fromMap(map['validate']) : null,
      defaultValue: map['defaultValue'] != null
          ? List<Option>.from(
              map['defaultValue']?.map((x) => Option.fromMap(x)))
          : null,
      isDisabled: map['isDisabled'] ?? false,
      options: List<Option>.from(map['options']?.map((x) => Option.fromMap(x))),
      selectType: CommonHelpers.enumFromString(
            SelectType.values,
            map['selectType'],
          ) ??
          SelectType.SINGLE,
      isSearchable: map['isSearchable'] ?? false,
    );
  }
}
