import 'package:yc_app_utils/yc_app_utils.dart';

class BSWidgetModel {
  BootstrapSectionUnion? bsWidget;

  BSWidgetModel({
    this.bsWidget,
  });

  factory BSWidgetModel.fromMap(Map<String, dynamic> map) {
    switch (map['bsWidget']['__typename']) {
      case 'BootstrapSectionStack':
        return BSWidgetModel(
          bsWidget: map['bsWidget'] != null
              ? BootstrapSectionStackModel.fromMap(map['bsWidget'])
              : null,
        );
      case 'BootstrapSectionLayer':
        return BSWidgetModel(
          bsWidget: map['bsWidget'] != null
              ? BootstrapSectionLayerModel.fromMap(map['bsWidget'])
              : null,
        );
      case 'BootstrapChild':
        return BSWidgetModel(
          bsWidget: map['bsWidget'] != null
              ? BootstrapChildModel.fromMap(map['bsWidget'])
              : null,
        );
      case 'StyledComponent':
        return BSWidgetModel(
          bsWidget: map['bsWidget'] != null
              ? StyledComponentModel.fromMap(map['bsWidget'])
              : null,
        );
      default:
        return BSWidgetModel(
          bsWidget: null,
        );
    }
  }
}
