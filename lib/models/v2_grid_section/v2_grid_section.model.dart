import 'package:yc_app_utils/models/click_action/v2_click_action.model.dart';
import 'package:yc_app_utils/models/form_component/form_component.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_component.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_column.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_layer.model.dart';
import 'package:yc_app_utils/models/v2_grid_section/v2_grid_section_row.model.dart';

class V2GridSectionModel {
  String? key;
  List<V2GridSectionLayerModel>? layers;
  List<V2GridSectionRowModel>? rows;
  List<V2GridSectionColumnModel>? columns;
  StyledComponentModel? styledComponent;
  FormComponentModel? formComponent;
  V2ClickAction? clickAction;
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
    this.formComponent,
    this.clickAction,
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
    FormComponentModel? formComponent,
    V2ClickAction? clickAction,
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
      formComponent: formComponent ?? this.formComponent,
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
      'rows': rows?.map((x) => x.toMap()).toList(),
      'columns': columns?.map((x) => x.toMap()).toList(),
      'styledComponent': styledComponent?.toMap(),
      'formComponent': formComponent?.toMap(),
      'clickAction': clickAction?.toMap(),
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
      formComponent: map['formComponent'] != null
          ? FormComponentModel.fromMap(map['formComponent'])
          : null,
      clickAction: map['clickAction'] != null
          ? V2ClickAction.fromMap(map['clickAction'])
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
