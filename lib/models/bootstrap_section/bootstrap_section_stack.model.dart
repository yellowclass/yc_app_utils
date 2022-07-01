import 'package:yc_app_utils/yc_app_utils.dart';

class BootstrapSectionStackModel with BootstrapSectionUnion {
  List<BootstrapSectionLayerModel> layers;

  BootstrapSectionStackModel({
    required this.layers,
  });

  Map<String, dynamic> toMap() {
    return {
      'layers': layers.map((x) => x.toMap()).toList(),
    };
  }

  factory BootstrapSectionStackModel.fromMap(Map<String, dynamic> map) {
    return BootstrapSectionStackModel(
      layers: List<BootstrapSectionLayerModel>.from(
          map['layers']?.map((x) => BootstrapSectionLayerModel.fromMap(x))),
    );
  }
}
