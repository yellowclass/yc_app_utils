import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_row.model.dart';

class V2GridSectionLayer {
  List<V2GridSectionRow>? rows;

  V2GridSectionLayer({
    this.rows,
  });

  V2GridSectionLayer copyWith({
    List<V2GridSectionRow>? rows,
  }) {
    return V2GridSectionLayer(
      rows: rows ?? this.rows,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'rows': rows?.map((x) => x.toMap()).toList(),
    };
  }

  factory V2GridSectionLayer.fromMap(Map<String, dynamic> map) {
    return V2GridSectionLayer(
      rows: map['rows'] != null
          ? List<V2GridSectionRow>.from(
              map['rows']?.map((x) => V2GridSectionRow.fromMap(x)))
          : null,
    );
  }
}
