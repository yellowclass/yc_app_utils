import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/common_helpers.dart';

import 'package:yc_app_utils/models/click_action.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_component.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section.model.dart';

class V2GridSectionColumnModel {
  String? key;
  V2GridSectionModel? gridSection;
  StyledComponentModel? data;
  ClickAction? clickAction;
  int? flexFactor;
  MainAxisAlignment flexAlignment;

  V2GridSectionColumnModel({
    this.key,
    this.gridSection,
    this.data,
    this.clickAction,
    this.flexFactor,
    this.flexAlignment = MainAxisAlignment.start,
  });

  V2GridSectionColumnModel copyWith({
    String? key,
    V2GridSectionModel? gridSection,
    StyledComponentModel? data,
    ClickAction? clickAction,
    int? flexFactor,
    MainAxisAlignment? flexAlignment,
  }) {
    return V2GridSectionColumnModel(
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

  factory V2GridSectionColumnModel.fromMap(Map<String, dynamic> map) {
    return V2GridSectionColumnModel(
      key: map['key'],
      gridSection: map['gridSection'] != null
          ? V2GridSectionModel.fromMap(map['gridSection'])
          : null,
      data: map['data'] != null
          ? StyledComponentModel.fromMap(map['data'])
          : null,
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
