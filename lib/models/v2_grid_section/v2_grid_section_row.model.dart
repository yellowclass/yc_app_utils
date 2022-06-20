import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/common_helpers.dart';

import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_column.model.dart';

class V2GridSectionRow {
  List<V2GridSectionColumn>? columns;
  MainAxisAlignment? flexAlignment;
  List<int>? padding;
  int? flexFactor;

  V2GridSectionRow({
    this.columns,
    this.flexAlignment,
    this.padding,
    this.flexFactor,
  });

  V2GridSectionRow copyWith({
    List<V2GridSectionColumn>? columns,
    MainAxisAlignment? flexAlignment,
    List<int>? padding,
    int? flexFactor,
  }) {
    return V2GridSectionRow(
      columns: columns ?? this.columns,
      flexAlignment: flexAlignment ?? this.flexAlignment,
      padding: padding ?? this.padding,
      flexFactor: flexFactor ?? this.flexFactor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'columns': columns?.map((x) => x.toMap()).toList(),
      'flexAlignment': flexAlignment?.name,
      'padding': padding,
      'flexFactor': flexFactor,
    };
  }

  factory V2GridSectionRow.fromMap(Map<String, dynamic> map) {
    return V2GridSectionRow(
      columns: map['columns'] != null
          ? List<V2GridSectionColumn>.from(
              map['columns']?.map((x) => V2GridSectionColumn.fromMap(x)))
          : null,
      flexAlignment: CommonHelpers.enumFromString(
            MainAxisAlignment.values,
            map['flexAlignment'],
          ) ??
          MainAxisAlignment.start,
      padding:
          map['padding'] == null ? <int>[] : List<int>.from(map['padding']),
      flexFactor: map['flexFactor']?.toInt(),
    );
  }
}
