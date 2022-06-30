import 'package:yc_app_utils/models/styled_component/styled_component.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_column.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_layer.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_row.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_stack.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_widget.model.dart';

class GSWidgetModel {
  V2GridSectionWidgetModel? gsWidget;

  GSWidgetModel({
    required this.gsWidget,
  });

  GSWidgetModel copyWith({
    V2GridSectionWidgetModel? gsWidget,
  }) {
    return GSWidgetModel(
      gsWidget: gsWidget ?? this.gsWidget,
    );
  }

  factory GSWidgetModel.fromMap(Map<String, dynamic> map) {
    switch (map['gsWidget']['__typename']) {
      case 'V2GridSectionStack':
        return GSWidgetModel(
          gsWidget: V2GridSectionStackModel.fromMap(map['gsWidget']),
        );
      case 'V2GridSectionLayer':
        return GSWidgetModel(
          gsWidget: V2GridSectionLayerModel.fromMap(map['gsWidget']),
        );
      case 'V2GridSectionRow':
        return GSWidgetModel(
          gsWidget: V2GridSectionRowModel.fromMap(map['gsWidget']),
        );
      case 'V2GridSectionColumn':
        return GSWidgetModel(
          gsWidget: V2GridSectionColumnModel.fromMap(map['gsWidget']),
        );
      case 'StyledComponent':
        return GSWidgetModel(
          gsWidget: StyledComponentModel.fromMap(map['gsWidget']),
        );
      default:
        return GSWidgetModel(
          gsWidget: null,
        );
    }
  }
}
