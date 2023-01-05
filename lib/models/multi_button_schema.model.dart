import 'package:yc_app_utils/yc_app_utils.dart';

class MultiButtonSchema {
  AxisAlignment alignment;
  List<FlexWidgetModel>? buttons;
  List<int>? padding;

  MultiButtonSchema({
    required this.alignment,
    this.buttons,
    this.padding,
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
    );
  }
}