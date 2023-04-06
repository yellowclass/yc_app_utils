import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/common_helpers.dart';

class AudioOverlayConfig {
  final String? avatarUrl;
  final Alignment? avatarPosition;
  AudioOverlayConfig({
    this.avatarUrl,
    this.avatarPosition,
  });

  factory AudioOverlayConfig.fromMap(Map<String, dynamic> map) {
    return AudioOverlayConfig(
      avatarUrl: map['avatarUrl'],
      avatarPosition: map['avatarPosition'] == null
          ? null
          : CommonHelpers.getAlignmentFromString(
              map['avatarPosition'],
            ),
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'avatarUrl': avatarUrl,
      'avatarPosition': avatarPosition,
    };
  }
}
