import 'package:yc_app_utils/yc_app_utils.dart';

class VideoPlayerSideMenuModel {
  List<GenericButtonV3Model>? options;
  int spacerIndex;
  SectionBackground? background;

  VideoPlayerSideMenuModel({
    this.options,
    required this.spacerIndex,
    this.background,
  });

  VideoPlayerSideMenuModel copyWith({
    List<GenericButtonV3Model>? options,
    int? spacerIndex,
    SectionBackground? background,
  }) {
    return VideoPlayerSideMenuModel(
      options: options ?? this.options,
      spacerIndex: spacerIndex ?? this.spacerIndex,
      background: background ?? this.background,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'options': options?.map((x) => x.toMap()).toList(),
      'spacerIndex': spacerIndex,
      'background': background?.toMap(),
    };
  }

  factory VideoPlayerSideMenuModel.fromMap(Map<String, dynamic> map) {
    List<GenericButtonV3Model>? options = map['options'] != null
        ? List<GenericButtonV3Model>.from(
            map['options']?.map((x) => GenericButtonV3Model.fromMap(x)))
        : null;
    return VideoPlayerSideMenuModel(
      options: options,
      spacerIndex: map['spacerIndex']?.toInt() ?? options?.length ?? 0,
      background: map['background'] != null
          ? SectionBackground.fromMap(map['background'])
          : null,
    );
  }
}
