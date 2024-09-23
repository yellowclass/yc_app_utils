import 'package:flutter/cupertino.dart';
import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/click_action/v2_click_action.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_component_union.dart';

class StyledVideoModel extends StyledComponentUnion {
  final String? key;
  final String url;
  final String thumbnail;
  final List<StyledVideoIconModel>? icons;
  final int initialDelay;
  final int width;
  final double volume;
  final double aspectRatio;
  final BoxFit? videoBoxFit;
  final bool loop;
  final bool hasSeekbar;
  final bool autoPlay;
  final int? loopCount;

  StyledVideoModel({
    required this.url,
    required this.thumbnail,
    this.initialDelay = 0,
    this.volume = 1,
    this.aspectRatio = 1,
    this.width = 0,
    this.loop = false,
    this.autoPlay = false,
    this.hasSeekbar = false,
    this.videoBoxFit,
    this.icons,
    this.key,
    this.loopCount,
  });

  StyledVideoModel copyWith({
    String? key,
    String? url,
    String? thumbnail,
    List<StyledVideoIconModel>? icons,
    int? initialDelay,
    int? width,
    double? volume,
    double? aspectRatio,
    BoxFit? videoBoxFit,
    bool? loop,
    bool? hasSeekbar,
    bool? autoPlay,
    int? loopCount,
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
      hasSeekbar: hasSeekbar ?? this.hasSeekbar,
      autoPlay: autoPlay ?? this.autoPlay,
      key: key ?? this.key,
      loopCount: loopCount ?? this.loopCount,
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
      'hasSeekbar': hasSeekbar,
      'autoPlay': autoPlay,
      'key': key,
      'icons': icons?.map((e) => e.toMap()),
      'loopCount': loopCount,
    };
  }

  factory StyledVideoModel.fromMap(Map<String, dynamic> map) {
    List<StyledVideoIconModel>? icons;
    if (map['icons'] != null) {
      icons = [];
      List iconsRaw = map['icons'] as List<dynamic>;
      for (int i = 0; i < iconsRaw.length; i++) {
        icons.add(StyledVideoIconModel.fromMap(iconsRaw[i], i));
      }
    }

    return StyledVideoModel(
      key: map['key'],
      url: map['url'] ?? '',
      thumbnail: map['thumbnail'] ?? '',
      videoBoxFit: CommonHelpers.enumFromString(
        BoxFit.values,
        map['videoBoxFit'] ?? '',
      ),
      aspectRatio: map['aspectRatio'] == null
          ? 1
          : double.tryParse(map['aspectRatio'].toString()) ?? 1,
      initialDelay: map['initialDelay'] ?? 0,
      volume: map['volume'] == null
          ? 0
          : double.tryParse(map['volume'].toString()) ?? 0,
      width: map['width'] ?? 1,
      loop: map['loop'] ?? false,
      hasSeekbar: map['hasSeekbar'] ?? false,
      autoPlay: map['autoplay'] ?? false,
      icons: icons,
      loopCount: map['loopCount'],
    );
  }
}

class StyledVideoIconModel {
  final String? activeIconUrl;
  final String? inactiveIconUrl;
  final Alignment? iconPosition;
  final V2ClickAction? clickAction;
  final int index;
  bool isActive;

  StyledVideoIconModel({
    required this.activeIconUrl,
    required this.inactiveIconUrl,
    required this.iconPosition,
    required this.clickAction,
    this.isActive = true,
    this.index = 0,
  });

  StyledVideoIconModel copyWith({
    String? activeIconUrl,
    String? inactiveIconUrl,
    Alignment? iconPosition,
    V2ClickAction? clickAction,
    int? index,
    bool? isActive,
  }) {
    return StyledVideoIconModel(
      index: index ?? this.index,
      activeIconUrl: activeIconUrl ?? this.activeIconUrl,
      inactiveIconUrl: inactiveIconUrl ?? this.inactiveIconUrl,
      iconPosition: iconPosition ?? this.iconPosition,
      clickAction: clickAction ?? this.clickAction,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'activeIconUrl': activeIconUrl,
      'inactiveIconUrl': inactiveIconUrl,
      'iconPosition': iconPosition?.toString(),
      'clickAction': clickAction?.toMap(),
      'index': index,
      'isActive': isActive
    };
  }

  factory StyledVideoIconModel.fromMap(Map<String, dynamic> map, int index) {
    return StyledVideoIconModel(
      index: index,
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
