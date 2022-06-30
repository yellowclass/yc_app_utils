import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_layer.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_widget.model.dart';

class V2GridSectionStackModel with V2GridSectionWidgetModel {
  List<V2GridSectionLayerModel> layers;

  V2GridSectionStackModel({
    required this.layers,
  });

  Map<String, dynamic> toMap() {
    return {
      'layers': layers.map((x) => x.toMap()).toList(),
    };
  }

  factory V2GridSectionStackModel.fromMap(Map<String, dynamic> map) {
    return V2GridSectionStackModel(
      layers: List<V2GridSectionLayerModel>.from(
        map['layers']?.map((x) => V2GridSectionLayerModel.fromMap(x)),
      ),
    );
  }
}
