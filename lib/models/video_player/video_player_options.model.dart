import 'package:yc_app_utils/yc_app_utils.dart';

class VideoPlayerOptionsModel {
  String videoUrl;
  VideoPlayerSideMenuModel? sideMenu;

  VideoPlayerOptionsModel({
    required this.videoUrl,
    this.sideMenu,
  });

  VideoPlayerOptionsModel copyWith({
    String? videoUrl,
    VideoPlayerSideMenuModel? sideMenu,
  }) {
    return VideoPlayerOptionsModel(
      videoUrl: videoUrl ?? this.videoUrl,
      sideMenu: sideMenu ?? this.sideMenu,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'videoUrl': videoUrl,
      'sideMenu': sideMenu?.toMap(),
    };
  }

  factory VideoPlayerOptionsModel.fromMap(Map<String, dynamic> map) {
    return VideoPlayerOptionsModel(
      videoUrl: map['videoUrl'] ?? '',
      sideMenu: map['sideMenu'] != null
          ? VideoPlayerSideMenuModel.fromMap(map['sideMenu'])
          : null,
    );
  }
}
