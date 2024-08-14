import 'package:yc_app_utils/yc_app_utils.dart';

class StyledCheckboxFieldModel extends FormComponentUnion {
  V2StyledTextModel? label;
  String name;
  Validation? validation;
  List<OptionModel>? checkboxDefaultValue;
  bool isDisabled;
  List<OptionModel> options;

  StyledCheckboxFieldModel({
    this.label,
    required this.name,
    this.validation,
    this.checkboxDefaultValue,
    this.isDisabled = false,
    required this.options,
  });

  StyledCheckboxFieldModel copyWith({
    V2StyledTextModel? label,
    String? name,
    Validation? validation,
    List<OptionModel>? checkboxDefaultValue,
    bool? isDisabled,
    List<OptionModel>? options,
    SelectType? selectType,
  }) {
    return StyledCheckboxFieldModel(
      label: label ?? this.label,
      name: name ?? this.name,
      validation: validation ?? this.validation,
      checkboxDefaultValue: checkboxDefaultValue ?? this.checkboxDefaultValue,
      isDisabled: isDisabled ?? this.isDisabled,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label?.toMap(),
      'name': name,
      'validation': validation?.toMap(),
      'checkboxDefaultValue': checkboxDefaultValue,
      'isDisabled': isDisabled,
      'options': options.map((x) => x.toMap()).toList(),
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
      checkboxDefaultValue: map['checkboxDefaultValue'] != null
          ? List<OptionModel>.from(
              map['checkboxDefaultValue']?.map((x) => OptionModel.fromMap(x)))
          : null,
      isDisabled: map['isDisabled'] ?? false,
      options: List<OptionModel>.from(
          map['options']?.map((x) => OptionModel.fromMap(x))),
    );
  }
}
