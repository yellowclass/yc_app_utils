import 'package:yc_app_utils/yc_app_utils.dart';

class V2GridSectionModel {
  String? key;
  List<V2GridSectionLayerModel>? layers;
  List<V2GridSectionRowModel>? rows;
  List<V2GridSectionColumnModel>? columns;
  StyledComponentModel? styledComponent;
  V2ClickAction? clickAction;
  bool containsForm;
  String? backgroundColor;
  String? borderColor;
  List<int>? borderRadius;
  List<int>? padding;

  V2GridSectionModel({
    this.key,
    this.layers,
    this.rows,
    this.columns,
    this.styledComponent,
    this.clickAction,
    this.containsForm = false,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.padding,
  });

  V2GridSectionModel copyWith({
    String? key,
    List<V2GridSectionLayerModel>? layers,
    List<V2GridSectionRowModel>? rows,
    List<V2GridSectionColumnModel>? columns,
    StyledComponentModel? styledComponent,
    V2ClickAction? clickAction,
    bool? containsForm,
    String? backgroundColor,
    String? borderColor,
    List<int>? borderRadius,
    List<int>? padding,
  }) {
    return V2GridSectionModel(
      key: key ?? this.key,
      layers: layers ?? this.layers,
      rows: rows ?? this.rows,
      columns: columns ?? this.columns,
      styledComponent: styledComponent ?? this.styledComponent,
      clickAction: clickAction ?? this.clickAction,
      containsForm: containsForm ?? this.containsForm,
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
      'rows': rows?.map((x) => x.toMap()).toList(),
      'columns': columns?.map((x) => x.toMap()).toList(),
      'styledComponent': styledComponent?.toMap(),
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
      layers: map['layers'] != null
          ? List<V2GridSectionLayerModel>.from(
              map['layers']?.map((x) => V2GridSectionLayerModel.fromMap(x)),
            )
          : null,
      rows: map['rows'] != null
          ? List<V2GridSectionRowModel>.from(
              map['rows']?.map((x) => V2GridSectionRowModel.fromMap(x)),
            )
          : null,
      columns: map['columns'] != null
          ? List<V2GridSectionColumnModel>.from(
              map['columns']?.map((x) => V2GridSectionColumnModel.fromMap(x)),
            )
          : null,
      styledComponent: map['styledComponent'] != null
          ? StyledComponentModel.fromMap(map['styledComponent'])
          : null,
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
