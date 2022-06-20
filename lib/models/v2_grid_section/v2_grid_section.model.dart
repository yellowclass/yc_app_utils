import 'package:yc_app_utils/models/click_action.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_layer.model.dart';

class V2GridSection {
  String? key;
  List<V2GridSectionLayer>? layers;
  ClickAction? clickAction;
  String? backgroundColor;
  String? borderColor;
  List<int>? borderRadius;
  List<int>? padding;

  V2GridSection({
    this.key,
    this.layers,
    this.clickAction,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
  });

  V2GridSection copyWith({
    String? key,
    List<V2GridSectionLayer>? layers,
    ClickAction? clickAction,
    String? backgroundColor,
    String? borderColor,
    List<int>? borderRadius,
    List<int>? padding,
  }) {
    return V2GridSection(
      key: key ?? this.key,
      layers: layers ?? this.layers,
      clickAction: clickAction ?? this.clickAction,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'layers': layers?.map((x) => x.toMap()).toList(),
      'clickAction': clickAction?.toMap(),
      'backgroundColor': backgroundColor,
      'borderColor': borderColor,
      'borderRadius': borderRadius,
      'padding': padding,
    };
  }

  factory V2GridSection.fromMap(Map<String, dynamic> map) {
    return V2GridSection(
      key: map['key'],
      layers: map['layers'] != null
          ? List<V2GridSectionLayer>.from(
              map['layers']?.map((x) => V2GridSectionLayer.fromMap(x)))
          : null,
      clickAction: map['clickAction'] != null
          ? ClickAction.fromMap(map['clickAction'])
          : null,
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
