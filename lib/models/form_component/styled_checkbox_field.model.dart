import 'package:yc_app_utils/yc_app_utils.dart';

class StyledCheckboxFieldModel {
  V2StyledTextModel? label;
  String name;
  Validation? validation;
  List<OptionModel>? defaultValue;
  bool isDisabled;
  List<OptionModel> options;
  SelectType selectType;

  StyledCheckboxFieldModel({
    this.label,
    required this.name,
    this.validation,
    this.defaultValue,
    this.isDisabled = false,
    required this.options,
    this.selectType = SelectType.SINGLE,
  });

  StyledCheckboxFieldModel copyWith({
    V2StyledTextModel? label,
    String? name,
    Validation? validation,
    List<OptionModel>? defaultValue,
    bool? isDisabled,
    List<OptionModel>? options,
    SelectType? selectType,
  }) {
    return StyledCheckboxFieldModel(
      label: label ?? this.label,
      name: name ?? this.name,
      validation: validation ?? this.validation,
      defaultValue: defaultValue ?? this.defaultValue,
      isDisabled: isDisabled ?? this.isDisabled,
      options: options ?? this.options,
      selectType: selectType ?? this.selectType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label?.toMap(),
      'name': name,
      'validation': validation?.toMap(),
      'defaultValue': defaultValue,
      'isDisabled': isDisabled,
      'options': options.map((x) => x.toMap()).toList(),
      'selectType': selectType.name,
    };
  }

  factory StyledCheckboxFieldModel.fromMap(Map<String, dynamic> map) {
    return StyledCheckboxFieldModel(
      label:
          map['label'] != null ? V2StyledTextModel.fromMap(map['label']) : null,
      name: map['name'] ?? '',
      validation: map['validation'] != null
          ? Validation.fromMap(map['validation'])
          : null,
      defaultValue: map['defaultValue'] != null
          ? List<OptionModel>.from(
              map['defaultValue']?.map((x) => OptionModel.fromMap(x)))
          : null,
      isDisabled: map['isDisabled'] ?? false,
      options: List<OptionModel>.from(
          map['options']?.map((x) => OptionModel.fromMap(x))),
      selectType: CommonHelpers.enumFromString(
            SelectType.values,
            map['selectType'],
          ) ??
          SelectType.SINGLE,
    );
  }
}
