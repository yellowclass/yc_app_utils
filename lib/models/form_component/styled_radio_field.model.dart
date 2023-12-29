import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:yc_app_utils/models/form_component/form_component_union.model.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class StyledRadioFieldModel with FormComponentUnion {
  V2StyledTextModel? label;
  String name;
  Validation? validation;
  OptionModel? radioDefaultValue;
  bool isDisabled;
  List<OptionModel> options;
  OptionsOrientation? radioButtonArrangement;

  StyledRadioFieldModel({
    this.label,
    required this.name,
    this.validation,
    this.radioDefaultValue,
    this.isDisabled = false,
    this.radioButtonArrangement = OptionsOrientation.wrap,
    required this.options,
  });

  StyledRadioFieldModel copyWith({
    V2StyledTextModel? label,
    String? name,
    Validation? validation,
    OptionModel? radioDefaultValue,
    bool? isDisabled,
    List<OptionModel>? options,
    OptionsOrientation? radioButtonArrangement,
  }) {
    return StyledRadioFieldModel(
      label: label ?? this.label,
      name: name ?? this.name,
      validation: validation ?? this.validation,
      radioDefaultValue: radioDefaultValue ?? this.radioDefaultValue,
      isDisabled: isDisabled ?? this.isDisabled,
      options: options ?? this.options,
      radioButtonArrangement:
          radioButtonArrangement ?? this.radioButtonArrangement,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'label': label?.toMap(),
      'name': name,
      'validation': validation?.toMap(),
      'radioDefaultValue': radioDefaultValue,
      'isDisabled': isDisabled,
      'options': options.map((x) => x.toMap()).toList(),
      'radioButtonArrangement': radioButtonArrangement,
    };
  }

  factory StyledRadioFieldModel.fromMap(Map<String, dynamic> map) {
    return StyledRadioFieldModel(
      label:
          map['label'] != null ? V2StyledTextModel.fromMap(map['label']) : null,
      name: map['name'] ?? '',
      validation: map['validation'] != null
          ? Validation.fromMap(map['validation'])
          : null,
      radioDefaultValue: map['radioDefaultValue'] != null
          ? OptionModel.fromMap(map['radioDefaultValue'])
          : null,
      isDisabled: map['isDisabled'] ?? false,
      options: List<OptionModel>.from(
          map['options']?.map((x) => OptionModel.fromMap(x))),
      radioButtonArrangement: CommonHelpers.getOptionsOrientationFromString(
              map['radioButtonArrangement']),
    );
  }
}
