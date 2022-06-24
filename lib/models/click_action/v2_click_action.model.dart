import 'package:yc_app_utils/helpers/helpers.dart';
import 'package:yc_app_utils/models/click_action/one_click_action.model.dart';

class V2ClickAction {
  SequenceTypeEnum sequenceType;
  List<OneClickAction>? actions;
  bool showRippleEffect;

  V2ClickAction({
    required this.sequenceType,
    this.actions,
    required this.showRippleEffect,
  });

  V2ClickAction copyWith({
    SequenceTypeEnum? sequenceType,
    List<OneClickAction>? actions,
    bool? showRippleEffect,
  }) {
    return V2ClickAction(
      sequenceType: sequenceType ?? this.sequenceType,
      actions: actions ?? this.actions,
      showRippleEffect: showRippleEffect ?? this.showRippleEffect,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sequenceType': sequenceType.name,
      'actions': actions?.map((x) => x.toMap()).toList(),
      'showRippleEffect': showRippleEffect,
    };
  }

  factory V2ClickAction.fromMap(Map<String, dynamic> map) {
    return V2ClickAction(
      sequenceType: CommonHelpers.enumFromString(
        SequenceTypeEnum.values,
        map['sequenceType'],
      )!,
      actions: map['actions'] != null
          ? List<OneClickAction>.from(
              map['actions']?.map((x) => OneClickAction.fromMap(x)))
          : null,
      showRippleEffect: map['showRippleEffect'] ?? false,
    );
  }
}

enum SequenceTypeEnum {
  PARALLEL,
  SEQUENTIAL,
}
