import 'package:yc_app_utils/yc_app_utils.dart';

class BootstrapSectionLayerModel with BootstrapSectionUnion {
  List<BootstrapChildModel> children;

  BootstrapSectionLayerModel({
    required this.children,
  });

  Map<String, dynamic> toMap() {
    return {
      'children': children.map((x) => x.toMap()).toList(),
    };
  }

  factory BootstrapSectionLayerModel.fromMap(Map<String, dynamic> map) {
    return BootstrapSectionLayerModel(
      children: List<BootstrapChildModel>.from(
        map['children']?.map((x) => BootstrapChildModel.fromMap(x)),
      ),
    );
  }
}
