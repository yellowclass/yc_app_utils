import 'package:yc_app_utils/yc_app_utils.dart';

class VideoPlayerOptionsModel {
  String url;
  VideoPlayerSideMenuModel? sideMenu;

  VideoPlayerOptionsModel({
    required this.url,
    this.sideMenu,
  });

  VideoPlayerOptionsModel copyWith({
    String? url,
    VideoPlayerSideMenuModel? sideMenu,
  }) {
    return VideoPlayerOptionsModel(
      url: url ?? this.url,
      sideMenu: sideMenu ?? this.sideMenu,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'sideMenu': sideMenu?.toMap(),
    };
  }

  factory VideoPlayerOptionsModel.fromMap(Map<String, dynamic> map) {
    return VideoPlayerOptionsModel(
      url: map['url'] ?? '',
      sideMenu: map['sideMenu'] != null
          ? VideoPlayerSideMenuModel.fromMap(map['sideMenu'])
          : null,
    );
  }
}
