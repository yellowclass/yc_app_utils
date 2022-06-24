import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/common_helpers.dart';

import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_column.model.dart';

class V2GridSectionRowModel {
  List<V2GridSectionColumnModel>? columns;
  MainAxisAlignment mainAxisAlignment;
  CrossAxisAlignment crossAxisAlignment;
  List<int>? padding;

  V2GridSectionRowModel({
    this.columns,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.padding,
  });

  V2GridSectionRowModel copyWith({
    List<V2GridSectionColumnModel>? columns,
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    List<int>? padding,
  }) {
    return V2GridSectionRowModel(
      columns: columns ?? this.columns,
      mainAxisAlignment: mainAxisAlignment ?? this.mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment ?? this.crossAxisAlignment,
      padding: padding ?? this.padding,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'columns': columns?.map((x) => x.toMap()).toList(),
      'mainAxisAlignment': mainAxisAlignment.name,
      'crossAxisAlignment': crossAxisAlignment.name,
      'padding': padding,
    };
  }

  factory V2GridSectionRowModel.fromMap(Map<String, dynamic> map) {
    return V2GridSectionRowModel(
      columns: map['columns'] != null
          ? List<V2GridSectionColumnModel>.from(
              map['columns']?.map((x) => V2GridSectionColumnModel.fromMap(x)))
          : null,
      mainAxisAlignment: CommonHelpers.getMainAxisAlignmentFromString(
        map['mainAxisAlignment'],
      ),
      crossAxisAlignment: CommonHelpers.getCrossAxisAlignmentFromString(
        map['crossAxisAlignment'],
      ),
      padding:
          map['padding'] == null ? <int>[] : List<int>.from(map['padding']),
    );
  }
}
