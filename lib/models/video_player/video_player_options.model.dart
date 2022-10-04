import 'package:yc_app_utils/yc_app_utils.dart';

class VideoPlayerOptionsModel {
  String videoUrl;
  int? playFrom;
  VideoPlayerSideMenuModel? sideMenu;

  VideoPlayerOptionsModel({
    required this.videoUrl,
    this.playFrom,
    this.sideMenu,
  });

  VideoPlayerOptionsModel copyWith({
    String? videoUrl,
    int? playFrom,
    VideoPlayerSideMenuModel? sideMenu,
  }) {
    return VideoPlayerOptionsModel(
      videoUrl: videoUrl ?? this.videoUrl,
      playFrom: playFrom ?? this.playFrom,
      sideMenu: sideMenu ?? this.sideMenu,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'videoUrl': videoUrl,
      'playFrom': playFrom,
      'sideMenu': sideMenu?.toMap(),
    };
  }

  factory VideoPlayerOptionsModel.fromMap(Map<String, dynamic> map) {
    return VideoPlayerOptionsModel(
      videoUrl: map['videoUrl'] ?? '',
      playFrom: map['playFrom'] ?? 0,
      sideMenu: map['sideMenu'] != null
          ? VideoPlayerSideMenuModel.fromMap(map['sideMenu'])
          : null,
    );
  }
}
