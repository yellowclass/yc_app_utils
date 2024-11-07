import 'dart:math';

import 'package:yc_app_utils/models/section_background/section_background.model.dart';
import 'package:yc_app_utils/models/styled_component/rich_text.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_component_union.dart';
import 'package:yc_app_utils/models/v2_text_style.model.dart';

class StyledShimmerModel extends StyledComponentUnion {
  final List<RichTextChildModel>? texts;
  final V2TextStyle? primaryTextStyle;
  final String? borderColor;
  final List<int>? borderRadius;
  final List<int>? padding;
  final SectionBackground? background;
  final StyledShimmerConfigModel? styledShimmerConfig;
  StyledShimmerModel({
    this.borderColor,
    this.borderRadius,
    this.padding,
    this.texts,
    this.primaryTextStyle,
    this.background,
    this.styledShimmerConfig,
  });

  factory StyledShimmerModel.fromMap(Map<String, dynamic> map) {
    return StyledShimmerModel(
      texts: map["texts"] != null
          ? List.from(
              map["texts"].map(
                (e) => RichTextChildModel.fromMap(e),
              ),
            )
          : null,
      primaryTextStyle: map['primaryTextStyle'] != null
          ? V2TextStyle.fromMap(map['primaryTextStyle'])
          : null,
      borderColor: map['borderColor'] == null ? null : map['borderColor'],
      borderRadius: map['borderRadius'] == null
          ? <int>[]
          : List<int>.from(map['borderRadius']),
      padding:
          map['padding'] == null ? <int>[] : List<int>.from(map['padding']),
      background: map['background'] != null
          ? SectionBackground.fromMap(map['background'] as Map<String, dynamic>)
          : null,
      styledShimmerConfig: map['styledShimmerConfig'] != null
          ? StyledShimmerConfigModel.fromMap(map['styledShimmerConfig'])
          : null,
    );
  }
}

class StyledShimmerConfigModel {
  final int initialDelay;
  final int repeatDelay;
  final int duration;
  final String color;
  final double tiltAngle;

  // Constructor
  StyledShimmerConfigModel({
    this.initialDelay = 0,
    this.repeatDelay = 0,
    this.duration = 1000,
    this.color = '#ffffff',
    this.tiltAngle = 3 * pi / 5,
  });

  // Factory method for creating an instance from JSON
  factory StyledShimmerConfigModel.fromMap(Map<String, dynamic> map) {
    return StyledShimmerConfigModel(
      initialDelay: map['initialDelay'] != null
          ? int.tryParse(map['initialDelay'].toString()) ?? 0
          : 0,
      repeatDelay: map['repeatDelay'] != null
          ? int.tryParse(map['repeatDelay'].toString()) ?? 0
          : 0,
      duration: map['duration'] != null
          ? int.tryParse(map['duration'].toString()) ?? 1000
          : 1000,
      color: map['color'] != null ? map['color'] : null,
      tiltAngle: map['tiltAngle'] != null
          ? double.tryParse(map['tiltAngle'].toString()) ?? 3 * pi / 5
          : 3 * pi / 5,
    );
  }
}
