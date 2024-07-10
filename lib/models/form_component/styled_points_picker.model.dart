import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/helpers.dart';
import 'package:yc_app_utils/models/click_action/v2_click_action.model.dart';
import 'package:yc_app_utils/models/form_component/form_component_union.model.dart';
import 'package:yc_app_utils/models/styled_component/v2_styled_text.model.dart';

class StyledPointsPickerModel with FormComponentUnion {
  String id;
  V2StyledTextModel? topLabel;
  V2StyledTextModel? bottomLabel;
  List<CircularButton>? pickerOptions;
  Alignment? topLabelAlignment;
  Alignment? bottomLabelAlignment;

  StyledPointsPickerModel({
    required this.id,
    this.topLabel,
    this.bottomLabel,
    this.topLabelAlignment,
    this.pickerOptions,
    this.bottomLabelAlignment,
  });

  factory StyledPointsPickerModel.fromMap(Map<String, dynamic> map) {
    return StyledPointsPickerModel(
      id: map['id'],
      topLabel: map['topLabel'] != null
          ? V2StyledTextModel.fromMap(map['topLabel'])
          : null,
      bottomLabel: map['bottomLabel'] != null
          ? V2StyledTextModel.fromMap(map['bottomLabel'])
          : null,
      pickerOptions: map['pickerOptions'] != null
          ? List<CircularButton>.from(
              map['pickerOptions'].map((item) => CircularButton.fromJson(item)))
          : null,
      topLabelAlignment: map['topLabelAlignment'] != null
          ? CommonHelpers.getAlignmentFromString(
              map['topLabelAlignment'],
            )
          : null,
      bottomLabelAlignment: map['bottomLabelAlignment'] != null
          ? CommonHelpers.getAlignmentFromString(
              map['bottomLabelAlignment'],
            )
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'topLabel': topLabel?.toMap(),
      'bottomLabel': bottomLabel?.toMap(),
      'pickerOptions': pickerOptions?.map((option) => option.toJson()).toList(),
      'topLabelAlignment': topLabelAlignment,
      'bottomLabelAlignment': bottomLabelAlignment,
    };
  }
}

class CircularButton {
  String? borderColor;
  V2StyledTextModel? selectedComponent;
  V2StyledTextModel? unSelectedComponent;
  V2ClickAction? onOptionClick;

  CircularButton({
    this.selectedComponent,
    this.unSelectedComponent,
    this.onOptionClick,
    this.borderColor,
  });

  factory CircularButton.fromJson(Map<String, dynamic> json) {
    return CircularButton(
      selectedComponent: json['selectedComponent'] != null
          ? V2StyledTextModel.fromMap(json['selectedComponent'])
          : null,
      unSelectedComponent: json['unSelectedComponent'] != null
          ? V2StyledTextModel.fromMap(json['unSelectedComponent'])
          : null,
      onOptionClick: json['onOptionClick'] != null
          ? V2ClickAction.fromMap(json['onOptionClick'])
          : null,
      borderColor: json['borderColor'] != null ? json['borderColor'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'selectedComponent': selectedComponent?.toMap(),
      'unSelectedComponent': unSelectedComponent?.toMap(),
      'onOptionClick': onOptionClick?.toMap(),
      'borderColor': borderColor,
    };
  }
}
