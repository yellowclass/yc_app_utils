import 'package:yc_app_utils/yc_app_utils.dart';

class FlexWidgetModel {
  int flexFactor;
  GenericButtonV3Model? button;

  FlexWidgetModel({
    required this.flexFactor,
    this.button,
  });

  factory FlexWidgetModel.fromMap(Map<String, dynamic> map) {
    return FlexWidgetModel(
      flexFactor: map['flexFactor']?.toInt() ?? 1,
      button: map['button'] != null
          ? GenericButtonV3Model.fromMap(map['button'])
          : null,
    );
  }

  FlexWidgetModel copyWith({
    int? flexFactor,
    GenericButtonV3Model? button,
  }) {
    return FlexWidgetModel(
      flexFactor: flexFactor ?? this.flexFactor,
      button: button ?? this.button,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'flexFactor': flexFactor,
      'button': button?.toMap(),
    };
  }
}
