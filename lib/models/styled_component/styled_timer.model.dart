import 'package:yc_app_utils/yc_app_utils.dart';

enum StickyPositionEnum {
  TOP,
  BOTTOM,
}

class StyledTimerModel with StyledComponentUnion {
  Duration duration;
  StickyPositionEnum? labelPosition;
  V2TextStyle? labelStyle;
  V2TextStyle? boxTextStyle;
  V2TextStyle? separatorTextStyle;

  StyledTimerModel({
    required this.duration,
    this.labelPosition,
    this.labelStyle,
    this.boxTextStyle,
    this.separatorTextStyle,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'duration': duration.inSeconds,
      'labelPosition': labelPosition?.name,
      'labelStyle': labelStyle?.toMap(),
      'boxTextStyle': boxTextStyle?.toMap(),
      'separatorTextStyle': separatorTextStyle?.toMap(),
    };
  }

  factory StyledTimerModel.fromMap(Map<String, dynamic> map) {
    return StyledTimerModel(
      duration: Duration(seconds: map['duration'] ?? 1),
      labelPosition: map['labelPosition'] != null
          ? CommonHelpers.enumFromString(
              StickyPositionEnum.values,
              map['labelPosition'],
            )
          : null,
      labelStyle: map['labelStyle'] != null
          ? V2TextStyle.fromMap(map['labelStyle'] as Map<String, dynamic>)
          : null,
      boxTextStyle: map['boxTextStyle'] != null
          ? V2TextStyle.fromMap(map['boxTextStyle'] as Map<String, dynamic>)
          : null,
      separatorTextStyle: map['separatorTextStyle'] != null
          ? V2TextStyle.fromMap(
              map['separatorTextStyle'] as Map<String, dynamic>)
          : null,
    );
  }
}
