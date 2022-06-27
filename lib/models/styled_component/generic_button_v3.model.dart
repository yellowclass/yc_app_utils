import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/common_helpers.dart';

import 'package:yc_app_utils/models/click_action/click_action.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_text.model.dart';
import 'package:yc_app_utils/models/symmetric_padding.model.dart';
import 'package:yc_app_utils/ui/styleguide/app_radius.dart';

class GenericButtonV3Model {
  String? key;
  List<GenericButtonV3Row>? buttonRows;
  double elevation;
  ClickAction? clickAction;
  String? backgroundColor;
  String? borderColor;
  double borderRadius;
  SymmetricPadding padding;
  int? height;

  GenericButtonV3Model({
    this.key,
    this.buttonRows,
    this.elevation = 0,
    this.clickAction,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = AppRadius.s,
    this.padding = const SymmetricPadding(
      horizontal: 0,
      vertical: 0,
    ),
    this.height,
  });

  factory GenericButtonV3Model.fromMap(Map<String, dynamic> map) {
    return GenericButtonV3Model(
      key: map['key'],
      buttonRows: map['buttonRows'] != null
          ? List<GenericButtonV3Row>.from(
              map['buttonRows']?.map(
                (x) => GenericButtonV3Row.fromMap(x),
              ),
            )
          : null,
      elevation: map['elevation'] == null ? 0 : map['elevation'].toDouble(),
      clickAction: map['clickAction'] != null
          ? ClickAction.fromMap(map['clickAction'])
          : null,
      backgroundColor: map['backgroundColor'],
      borderColor: map['borderColor'],
      borderRadius: map['borderRadius'] == null
          ? AppRadius.s
          : map['borderRadius'].toDouble(),
      padding: map['padding'] != null
          ? SymmetricPadding.fromMap(map['padding'])
          : SymmetricPadding(
              horizontal: 0,
              vertical: 0,
            ),
      height: map["height"],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'buttonRows': List<dynamic>.from(
          buttonRows?.map((GenericButtonV3Row x) => x.toMap()) ?? {}),
      'elevation': elevation,
      'clickAction': clickAction?.toMap(),
      'backgroundColor': backgroundColor,
      'borderColor': borderColor,
      'borderRadius': borderRadius,
      'padding': padding.toMap(),
      'height': height,
    };
  }
}

class GenericButtonV3Row {
  List<StyledText>? buttonColumnData;
  MainAxisAlignment flexAlignment;

  GenericButtonV3Row({
    this.buttonColumnData,
    this.flexAlignment = MainAxisAlignment.center,
  });

  factory GenericButtonV3Row.fromMap(Map<String, dynamic> map) {
    return GenericButtonV3Row(
      buttonColumnData: map['buttonColumnData'] != null
          ? List<StyledText>.from(
              map['buttonColumnData']?.map(
                (dynamic x) => StyledText.fromMap(x),
              ),
            )
          : null,
      flexAlignment: CommonHelpers.getFlexAlignmentFromString(
        map['flexAlignment'],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'buttonColumnData': buttonColumnData == null
          ? null
          : List<dynamic>.from(
              buttonColumnData?.map((StyledText x) => x.toMap()) ?? {}),
      'flexAlignment': flexAlignment.name,
    };
  }
}
