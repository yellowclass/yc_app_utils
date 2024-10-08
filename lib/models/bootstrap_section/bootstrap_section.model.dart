import 'package:yc_app_utils/yc_app_utils.dart';

class BootstrapSectionModel extends BootstrapChildUnion {
  String key;
  BootstrapSectionUnion? bsData;
  String? miscParams;
  V2ClickAction? clickAction;
  bool containsForm;
  SectionBackground? background;
  String? borderColor;
  List<int>? borderRadius;
  List<int>? padding;
  double? height;
  double? width;
  GenericButtonV3Model? bottomActionButton;
  double? borderWidth;

  BootstrapSectionModel({
    required this.key,
    required this.bsData,
    this.clickAction,
    required this.containsForm,
    this.background,
    this.miscParams,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.height,
    this.width,
    this.bottomActionButton,
    this.borderWidth,
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
      'miscParams': miscParams,
      'borderRadius': borderRadius,
      'padding': padding,
      'height': height,
      'width': width,
      'bottomActionButton': bottomActionButton?.toString() ?? '',
      'borderWidth': borderWidth,
    };
  }

  factory BootstrapSectionModel.fromMap(Map<String, dynamic> map) {
    BootstrapSectionUnion? bsData;
    switch (map['bsData']?['__typename']) {
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
      miscParams: map['miscParams'],
      borderRadius: map['borderRadius'] == null
          ? <int>[]
          : List<int>.from(map['borderRadius']),
      padding:
          map['padding'] == null ? <int>[] : List<int>.from(map['padding']),
      height: map['height']?.toDouble(),
      width: map['width']?.toDouble(),
      bottomActionButton: map['bottomActionButton'] != null
          ? GenericButtonV3Model.fromMap(map['bottomActionButton'])
          : null,
      borderWidth: map['borderWidth']?.toDouble(),
    );
  }

  BootstrapSectionModel copyWith({
    String? key,
    BootstrapSectionUnion? bsData,
    String? miscParams,
    V2ClickAction? clickAction,
    bool? containsForm,
    SectionBackground? background,
    String? borderColor,
    List<int>? borderRadius,
    List<int>? padding,
    double? height,
    double? width,
    GenericButtonV3Model? bottomActionButton,
    double? borderWidth,
  }) {
    return BootstrapSectionModel(
      key: key ?? this.key,
      bsData: bsData ?? this.bsData,
      miscParams: miscParams ?? this.miscParams,
      clickAction: clickAction ?? this.clickAction,
      containsForm: containsForm ?? this.containsForm,
      background: background ?? this.background,
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
      height: height ?? this.height,
      width: width ?? this.width,
      bottomActionButton: bottomActionButton ?? this.bottomActionButton,
      borderWidth: borderWidth ?? this.borderWidth,
    );
  }
}
