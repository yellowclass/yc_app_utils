import 'package:yc_app_utils/yc_app_utils.dart';

class BootstrapSectionModel with BootstrapChildUnion {
  String key;
  BSWidgetModel data;
  V2ClickAction? clickAction;
  bool containsForm;
  SectionBackground? background;
  String? borderColor;
  List<int>? borderRadius;
  List<int>? padding;
  double? height;

  BootstrapSectionModel({
    required this.key,
    required this.data,
    this.clickAction,
    required this.containsForm,
    this.background,
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.height,
  });

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      // 'data': data.toMap(),
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
    return BootstrapSectionModel(
      key: map['key'] ?? '',
      data: BSWidgetModel.fromMap(map['data']),
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
