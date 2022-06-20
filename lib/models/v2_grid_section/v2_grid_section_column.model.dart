import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/common_helpers.dart';

import 'package:yc_app_utils/models/click_action.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_component.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section.model.dart';

class V2GridSectionColumn {
  String? key;
  V2GridSection? gridSection;
  StyledComponent? data;
  ClickAction? clickAction;
  int? flexFactor;
  MainAxisAlignment flexAlignment;

  V2GridSectionColumn({
    this.key,
    this.gridSection,
    this.data,
    this.clickAction,
    this.flexFactor,
    this.flexAlignment = MainAxisAlignment.start,
  });

  V2GridSectionColumn copyWith({
    String? key,
    V2GridSection? gridSection,
    StyledComponent? data,
    ClickAction? clickAction,
    int? flexFactor,
    MainAxisAlignment? flexAlignment,
  }) {
    return V2GridSectionColumn(
      key: key ?? this.key,
      gridSection: gridSection ?? this.gridSection,
      data: data ?? this.data,
      clickAction: clickAction ?? this.clickAction,
      flexFactor: flexFactor ?? this.flexFactor,
      flexAlignment: flexAlignment ?? this.flexAlignment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'gridSection': gridSection?.toMap(),
      'data': data?.toMap(),
      'clickAction': clickAction?.toMap(),
      'flexFactor': flexFactor,
      'flexAlignment': flexAlignment.name,
    };
  }

  factory V2GridSectionColumn.fromMap(Map<String, dynamic> map) {
    return V2GridSectionColumn(
      key: map['key'],
      gridSection: map['gridSection'] != null
          ? V2GridSection.fromMap(map['gridSection'])
          : null,
      data: map['data'] != null ? StyledComponent.fromMap(map['data']) : null,
      clickAction: map['clickAction'] != null
          ? ClickAction.fromMap(map['clickAction'])
          : null,
      flexFactor: map['flexFactor']?.toInt(),
      flexAlignment: CommonHelpers.enumFromString(
            MainAxisAlignment.values,
            map['flexAlignment'],
          ) ??
          MainAxisAlignment.start,
    );
  }
}
