// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:yc_app_utils/yc_app_utils.dart';

class MultiButtonSchema {
  AxisAlignment alignment;
  List<FlexWidgetModel>? buttons;
  List<int>? padding;
  SectionBackground? background;

  MultiButtonSchema({
    required this.alignment,
    this.buttons,
    this.padding,
    this.background,
  });

  factory MultiButtonSchema.fromMap(Map<String, dynamic> map) {
    return MultiButtonSchema(
      alignment: CommonHelpers.enumFromString(
              AxisAlignment.values, map['alignment']) ??
          AxisAlignment.HORIZONTAL,
      buttons: map['buttons'] != null
          ? List<FlexWidgetModel>.from(
              map['buttons']?.map((x) => FlexWidgetModel.fromMap(x)))
          : null,
      padding: map["padding"] != null ? List<int>.from(map["padding"]) : null,
      background: map['background'] != null
          ? SectionBackground.fromMap(map['background'])
          : null,
    );
  }

  @override
  String toString() {
    return 'MultiButtonSchema(alignment: $alignment, buttons: $buttons, padding: $padding, background: $background)';
  }
}
