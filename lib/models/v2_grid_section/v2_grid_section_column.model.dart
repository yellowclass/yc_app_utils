import 'package:flutter/material.dart';

import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/form_component/form_component.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_component.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_gs_column_data_widget.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_widget.model.dart';

class V2GridSectionColumnModel with V2GridSectionWidgetModel {
  String? key;
  V2GSColumnDataWidgetModel? widget;
  int? flexFactor;
  MainAxisAlignment mainAxisAlignment;
  CrossAxisAlignment crossAxisAlignment;

  V2GridSectionColumnModel({
    this.key,
    this.widget,
    this.flexFactor,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      // 'widget': widget?.toMap(),
      'flexFactor': flexFactor,
      'mainAxisAlignment': mainAxisAlignment.name,
      'crossAxisAlignment': crossAxisAlignment.name,
    };
  }

  factory V2GridSectionColumnModel.fromMap(Map<String, dynamic> map) {
    late V2GSColumnDataWidgetModel? widget;
    switch (map['__typename']) {
      case 'StyledComponent':
        widget = StyledComponentModel.fromMap(map);
        break;
      case 'FormComponent':
        widget = FormComponentModel.fromMap(map);
        break;
      case 'V2GridSection':
        widget = V2GridSectionModel.fromMap(map);
        break;
      default:
        widget = null;
    }
    return V2GridSectionColumnModel(
      key: map['key'],
      widget: widget,
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
