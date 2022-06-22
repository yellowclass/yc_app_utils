import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/common_helpers.dart';

import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_column.model.dart';

class V2GridSectionRowModel {
  List<V2GridSectionColumnModel>? columns;
  MainAxisAlignment flexAlignment;
  List<int>? padding;

  V2GridSectionRowModel({
    this.columns,
    this.flexAlignment = MainAxisAlignment.start,
    this.padding,
  });

  V2GridSectionRowModel copyWith({
    List<V2GridSectionColumnModel>? columns,
    MainAxisAlignment? flexAlignment,
    List<int>? padding,
  }) {
    return V2GridSectionRowModel(
      columns: columns ?? this.columns,
      flexAlignment: flexAlignment ?? this.flexAlignment,
      padding: padding ?? this.padding,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'columns': columns?.map((x) => x.toMap()).toList(),
      'flexAlignment': flexAlignment.name,
      'padding': padding,
    };
  }

  factory V2GridSectionRowModel.fromMap(Map<String, dynamic> map) {
    return V2GridSectionRowModel(
      columns: map['columns'] != null
          ? List<V2GridSectionColumnModel>.from(
              map['columns']?.map((x) => V2GridSectionColumnModel.fromMap(x)))
          : null,
      flexAlignment: CommonHelpers.enumFromString(
            MainAxisAlignment.values,
            map['flexAlignment'],
          ) ??
          MainAxisAlignment.start,
      padding:
          map['padding'] == null ? <int>[] : List<int>.from(map['padding']),
    );
  }
}
