import 'package:yc_app_utils/yc_app_utils.dart';

class VideoPlayerOptionsModel {
  String videoUrl;
  int? playFrom;
  VideoPlayerSideMenuModel? sideMenu;
  List<VideoPlayerOverlayEnum>? persistentOptions;
  AlertDialogModel? videoEndDialog;

  VideoPlayerOptionsModel({
    required this.videoUrl,
    this.playFrom,
    this.sideMenu,
    this.persistentOptions,
    this.videoEndDialog,
  });

  VideoPlayerOptionsModel copyWith({
    String? videoUrl,
    int? playFrom,
    VideoPlayerSideMenuModel? sideMenu,
    List<VideoPlayerOverlayEnum>? persistentOptions,
    AlertDialogModel? videoEndDialog,
  }) {
    return VideoPlayerOptionsModel(
      videoUrl: videoUrl ?? this.videoUrl,
      playFrom: playFrom ?? this.playFrom,
      sideMenu: sideMenu ?? this.sideMenu,
      persistentOptions: persistentOptions ?? this.persistentOptions,
      videoEndDialog: videoEndDialog ?? this.videoEndDialog,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'videoUrl': videoUrl,
      'playFrom': playFrom,
      'sideMenu': sideMenu?.toMap(),
      'videoEndDialog': videoEndDialog?.toMap(),
    };
  }

  factory VideoPlayerOptionsModel.fromMap(Map<String, dynamic> map) {
    return VideoPlayerOptionsModel(
      videoUrl: map['videoUrl'] ?? '',
      playFrom: map['playFrom']?.toInt(),
      sideMenu: map['sideMenu'] != null
          ? VideoPlayerSideMenuModel.fromMap(map['sideMenu'])
          : null,
      persistentOptions: map['persistentOptions'] != null
          ? List<VideoPlayerOverlayEnum>.from(map['persistentOptions']?.map(
              (x) => CommonHelpers.enumFromString(
                  VideoPlayerOverlayEnum.values, x)))
          : null,
      videoEndDialog: map['videoEndDialog'] != null
          ? AlertDialogModel.fromMap(map['videoEndDialog'])
          : null,
    );
  }
}
