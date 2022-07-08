import 'package:yc_app_utils/yc_app_utils.dart';

class BootstrapSectionModel with BootstrapChildUnion {
  String key;
  BootstrapSectionUnion? bsData;
  V2ClickAction? clickAction;
  bool containsForm;
  SectionBackground? background;
  String? borderColor;
  List<int>? borderRadius;
  List<int>? padding;
  double? height;

  BootstrapSectionModel({
    required this.key,
    required this.bsData,
    this.clickAction,
    required this.containsForm,
    this.background,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.height,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> bsDataMap = {};
    switch (bsData.runtimeType) {
      case BootstrapSectionStackModel:
        bsDataMap = (bsData as BootstrapSectionStackModel).toMap();
        break;
      case BootstrapSectionLayerModel:
        bsDataMap = (bsData as BootstrapSectionLayerModel).toMap();
        break;
      case BootstrapSectionChildModel:
        bsDataMap = (bsData as BootstrapSectionChildModel).toMap();
        break;
      case StyledComponentModel:
        bsDataMap = (bsData as StyledComponentModel).toMap();
        break;
      default:
    }
    return {
      'key': key,
      'bsData': bsDataMap,
      'clickAction': clickAction?.toMap(),
      'containsForm': containsForm,
      'background': background?.toMap(),
      'borderColor': borderColor,
      'borderRadius': borderRadius,
      'padding': padding,
      'height': height,
    };
  }

  factory BootstrapSectionModel.fromMap(Map<String, dynamic> map) {
    BootstrapSectionUnion? bsData;
    switch (map['bsData']['__typename']) {
      case 'BootstrapSectionStack':
        bsData = map['bsData'] != null
            ? BootstrapSectionStackModel.fromMap(map['bsData'])
            : null;
        break;
      case 'BootstrapSectionLayer':
        bsData = map['bsData'] != null
            ? BootstrapSectionLayerModel.fromMap(map['bsData'])
            : null;
        break;
      case 'BootstrapSectionChild':
        bsData = map['bsData'] != null
            ? BootstrapSectionChildModel.fromMap(map['bsData'])
            : null;
        break;
      case 'StyledComponent':
        bsData = map['bsData'] != null
            ? StyledComponentModel.fromMap(map['bsData'])
            : null;
        break;
      default:
        bsData = null;
    }
    return BootstrapSectionModel(
      key: map['key'] ?? '',
      bsData: bsData,
      clickAction: map['clickAction'] != null
          ? V2ClickAction.fromMap(map['clickAction'])
          : null,
      containsForm: map['containsForm'] ?? false,
      background: map['background'] != null
          ? SectionBackground.fromMap(map['background'])
          : null,
      borderColor: map['borderColor'],
      borderRadius: map['borderRadius'] == null
          ? <int>[]
          : List<int>.from(map['borderRadius']),
      padding:
          map['padding'] == null ? <int>[] : List<int>.from(map['padding']),
      height: map['height']?.toDouble(),
    );
  }
}
