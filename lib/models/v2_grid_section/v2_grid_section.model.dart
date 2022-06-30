import 'package:yc_app_utils/yc_app_utils.dart';

class V2GridSectionModel with V2GSColumnDataWidgetModel {
  String? key;
  GSWidgetModel? data;
  V2ClickAction? clickAction;
  bool containsForm;
  String? backgroundColor;
  String? borderColor;
  List<int>? borderRadius;
  List<int>? padding;

  V2GridSectionModel({
    this.key,
    this.data,
    this.clickAction,
    this.containsForm = false,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
  });

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      // 'data': data?.toMap(),
      'clickAction': clickAction?.toMap(),
      'containsForm': containsForm,
      'backgroundColor': backgroundColor,
      'borderColor': borderColor,
      'borderRadius': borderRadius,
      'padding': padding,
    };
  }

  factory V2GridSectionModel.fromMap(Map<String, dynamic> map) {
    return V2GridSectionModel(
      key: map['key'],
      data: map['data'] != null ? GSWidgetModel.fromMap(map['data']) : null,
      clickAction: map['clickAction'] != null
          ? V2ClickAction.fromMap(map['clickAction'])
          : null,
      containsForm: map['containsForm'] ?? false,
      backgroundColor: map['backgroundColor'],
      borderColor: map['borderColor'],
      borderRadius: map['borderRadius'] == null
          ? <int>[]
          : List<int>.from(map['borderRadius']),
      padding:
          map['padding'] == null ? <int>[] : List<int>.from(map['padding']),
    );
  }
}
