import 'package:yc_app_utils/helpers/helpers.dart';
import 'package:yc_app_utils/models/click_action/one_click_action.model.dart';

class V2ClickAction {
  SequenceTypeEnum sequenceType;
  List<OneClickAction> actions;
  bool showRippleEffect;
  bool refreshOrigin;

  V2ClickAction({
    required this.sequenceType,
    required this.actions,
    required this.showRippleEffect,
    this.refreshOrigin = false,
  });

  V2ClickAction copyWith({
    SequenceTypeEnum? sequenceType,
    List<OneClickAction>? actions,
    bool? showRippleEffect,
    bool? refreshOrigin,
  }) {
    return V2ClickAction(
      sequenceType: sequenceType ?? this.sequenceType,
      actions: actions ?? this.actions,
      showRippleEffect: showRippleEffect ?? this.showRippleEffect,
      refreshOrigin: refreshOrigin ?? this.refreshOrigin,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sequenceType': sequenceType.name,
      'actions': actions.map((x) => x.toMap()).toList(),
      'showRippleEffect': showRippleEffect,
      'refreshOrigin': refreshOrigin,
    };
  }

  factory V2ClickAction.fromMap(Map<String, dynamic> map) {
    return V2ClickAction(
      sequenceType: CommonHelpers.enumFromString(
        SequenceTypeEnum.values,
        map['sequenceType'],
      )!,
      actions: List<OneClickAction>.from(
          map['actions']?.map((x) => OneClickAction.fromMap(x))),
      showRippleEffect: map['showRippleEffect'] ?? false,
      refreshOrigin: map['refreshOrigin'] ?? false,
    );
  }
}

enum SequenceTypeEnum {
  PARALLEL,
  SEQUENTIAL,
}

extension V2ClickActionHelper on V2ClickAction {
  bool hasAnyDefaultAction() {
    return actions.any((element) {
      return element.type == V2ClickActionTypesEnum.DEFAULT;
    });
  }

  OneClickAction? getFirstDefault() {
    if (hasAnyDefaultAction()) {
      for (var element in actions) {
        if (element.type == V2ClickActionTypesEnum.DEFAULT) {
          return element;
        }
      }
    }
    return null;
  }
}
