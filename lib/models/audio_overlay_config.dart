import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/click_action/v2_click_action.model.dart';

class AudioOverlayConfig {
  final String? avatarUrl;
  final Alignment? avatarPosition;
  final V2ClickAction? avatarClickAction;
  final List<int>? avatarPadding;
  final Size? avatarSize;

  AudioOverlayConfig({
    this.avatarUrl,
    this.avatarPosition,
    this.avatarClickAction,
    this.avatarPadding,
    this.avatarSize,
  });

  factory AudioOverlayConfig.fromMap(Map<String, dynamic> map) {
    return AudioOverlayConfig(
      avatarUrl: map['avatarUrl'],
      avatarPosition: map['avatarPosition'] == null
          ? null
          : CommonHelpers.getAlignmentFromString(
              map['avatarPosition'],
            ),
      avatarClickAction: map['avatarClickAction'] != null
          ? V2ClickAction.fromMap(map['avatarClickAction'])
          : null,
      avatarSize: map['avatarSize'] != null
          ? Size(
              (map['avatarSize']['height'] ?? 0).toDouble(),
              (map['avatarSize']['width'] ?? 0).toDouble(),
            )
          : null,
      avatarPadding:
          map['avatarPadding'] != null ? List.from(map['avatarPadding']) : null,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'avatarUrl': avatarUrl,
      'avatarPosition': avatarPosition,
      'avatarClickAction': avatarClickAction?.toMap(),
      'avatarPadding': avatarPadding,
      'avatarSize': avatarSize.toString(),
    };
  }
}
