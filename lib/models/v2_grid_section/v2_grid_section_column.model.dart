import 'package:flutter/material.dart';

import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/click_action/v2_click_action.model.dart';
import 'package:yc_app_utils/models/form_component/form_component.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_component.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section.model.dart';

class V2GridSectionColumnModel {
  String? key;
  V2GridSectionModel? gridSection;
  StyledComponentModel? styledComponent;
  FormComponentModel? formComponent;
  V2ClickAction? clickAction;
  int? flexFactor;
  MainAxisAlignment mainAxisAlignment;
  CrossAxisAlignment crossAxisAlignment;

  V2GridSectionColumnModel({
    this.key,
    this.gridSection,
    this.styledComponent,
    this.formComponent,
    this.clickAction,
    this.flexFactor,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  V2GridSectionColumnModel copyWith({
    String? key,
    V2GridSectionModel? gridSection,
    StyledComponentModel? styledComponent,
    FormComponentModel? formComponent,
    V2ClickAction? clickAction,
    int? flexFactor,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
  }) {
    return V2GridSectionColumnModel(
      key: key ?? this.key,
      gridSection: gridSection ?? this.gridSection,
      styledComponent: styledComponent ?? this.styledComponent,
      formComponent: formComponent ?? this.formComponent,
      clickAction: clickAction ?? this.clickAction,
      flexFactor: flexFactor ?? this.flexFactor,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'gridSection': gridSection?.toMap(),
      'data': styledComponent?.toMap() ?? formComponent?.toMap(),
      'clickAction': clickAction?.toMap(),
      'flexFactor': flexFactor,
      'mainAxisAlignment': mainAxisAlignment.name,
      'crossAxisAlignment': crossAxisAlignment.name,
    };
  }

  factory V2GridSectionColumnModel.fromMap(Map<String, dynamic> map) {
    return V2GridSectionColumnModel(
      key: map['key'],
      gridSection: map['gridSection'] != null
          ? V2GridSectionModel.fromMap(map['gridSection'])
          : null,
      styledComponent: map['data'] != null
          ? StyledComponentModel.fromMap(map['data'])
          : null,
      formComponent:
          map['data'] != null ? FormComponentModel.fromMap(map['data']) : null,
      clickAction: map['clickAction'] != null
          ? V2ClickAction.fromMap(map['clickAction'])
          : null,
      flexFactor: map['flexFactor']?.toInt(),
      mainAxisAlignment: CommonHelpers.getMainAxisAlignmentFromString(
        map['mainAxisAlignment'],
      ),
      crossAxisAlignment: CommonHelpers.getCrossAxisAlignmentFromString(
        map['crossAxisAlignment'],
      ),
    );
  }
}
