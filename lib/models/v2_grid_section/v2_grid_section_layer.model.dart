import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_row.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_widget.model.dart';

class V2GridSectionLayerModel with V2GridSectionWidgetModel {
  List<V2GridSectionRowModel> rows;

  V2GridSectionLayerModel({
    required this.rows,
  });

  V2GridSectionLayerModel copyWith({
    List<V2GridSectionRowModel>? rows,
  }) {
    return V2GridSectionLayerModel(
      rows: rows ?? this.rows,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rows': rows.map((x) => x.toMap()).toList(),
    };
  }

  factory V2GridSectionLayerModel.fromMap(Map<String, dynamic> map) {
    return V2GridSectionLayerModel(
      rows: List<V2GridSectionRowModel>.from(
        map['rows']?.map((x) => V2GridSectionRowModel.fromMap(x)),
      ),
    );
  }
}
