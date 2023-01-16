import 'package:flutter/cupertino.dart';
import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/click_action/v2_click_action.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_component_union.dart';

class StyledVideoModel with StyledComponentUnion {
  String url;
  String thumbnail;
  List<StyledVideoIconModel>? icons;
  int initialDelay;
  int width;
  double volume;
  double aspectRatio;
  BoxFit? videoBoxFit;
  bool loop;

  StyledVideoModel({
    required this.url,
    required this.thumbnail,
    this.initialDelay = 0,
    this.volume = 1,
    this.aspectRatio = 1,
    this.width = 0,
    this.loop = false,
    this.videoBoxFit,
    this.icons,
  });

  StyledVideoModel copyWith({
    String? url,
    String? thumbnail,
    List<StyledVideoIconModel>? icons,
    int? initialDelay,
    int? width,
    double? volume,
    double? aspectRatio,
    BoxFit? videoBoxFit,
    bool? loop,
  }) {
    return StyledVideoModel(
      url: url ?? this.url,
      thumbnail: thumbnail ?? this.thumbnail,
      icons: icons ?? this.icons,
      initialDelay: initialDelay ?? this.initialDelay,
      width: width ?? this.width,
      volume: volume ?? this.volume,
      aspectRatio: aspectRatio ?? this.aspectRatio,
      videoBoxFit: videoBoxFit ?? this.videoBoxFit,
      loop: loop ?? this.loop,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'thumbnail': thumbnail,
      'videoBoxFit': videoBoxFit?.name,
      'aspectRatio': aspectRatio,
      'initialDelay': initialDelay,
      'volume': volume,
      'width': width,
      'loop': loop,
      'icons': icons?.map((e) => e.toMap()),
    };
  }

  factory StyledVideoModel.fromMap(Map<String, dynamic> map) {
    return StyledVideoModel(
      url: map['url'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      videoBoxFit: CommonHelpers.enumFromString(
        BoxFit.values,
        map['videoBoxFit'] ?? '',
      ),
      aspectRatio: map['aspectRatio'] ?? 1,
      initialDelay: map['initialDelay'] ?? 0,
      volume: map['volume'] ?? 0,
      width: map['width'] ?? 0,
      loop: map['loop'] ?? false,
      icons: map['icons'] == null
          ? null
          : (map['icons'] as List<dynamic>)
              .map((e) => StyledVideoIconModel.fromMap(e))
              .toList(),
    );
  }
}

class StyledVideoIconModel {
  String? activeIconUrl;
  String? inactiveIconUrl;
  Alignment? iconPosition;
  V2ClickAction? clickAction;

  StyledVideoIconModel({
    required this.activeIconUrl,
    required this.inactiveIconUrl,
    required this.iconPosition,
    required this.clickAction,
  });

  StyledVideoIconModel copyWith({
    String? activeIconUrl,
    String? inactiveIconUrl,
    Alignment? iconPosition,
    V2ClickAction? clickAction,
  }) {
    return StyledVideoIconModel(
      activeIconUrl: activeIconUrl ?? this.activeIconUrl,
      inactiveIconUrl: inactiveIconUrl ?? this.inactiveIconUrl,
      iconPosition: iconPosition ?? this.iconPosition,
      clickAction: clickAction ?? this.clickAction,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'activeIconUrl': activeIconUrl,
      'inactiveIconUrl': inactiveIconUrl,
      'iconPosition': iconPosition?.toString(),
      'clickAction': clickAction?.toMap(),
    };
  }

  factory StyledVideoIconModel.fromMap(Map<String, dynamic> map) {
    return StyledVideoIconModel(
      activeIconUrl: map['activeIconUrl'],
      inactiveIconUrl: map['inactiveIconUrl'],
      iconPosition: CommonHelpers.getAlignmentFromString(
        map['iconPosition'],
      ),
      clickAction: map['clickAction'] == null
          ? null
          : V2ClickAction.fromMap(map['clickAction']),
    );
  }
}
