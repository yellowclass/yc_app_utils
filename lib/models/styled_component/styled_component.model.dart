import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/click_action/v2_click_action.model.dart';
import 'package:yc_app_utils/models/section_background/section_background.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_image.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_video.model.dart';
import 'package:yc_app_utils/models/styled_component/v2_styled_text.model.dart';

class StyledComponentModel {
  StyledComponentEnum type;
  V2StyledTextModel? textDetails;
  StyledImageModel? imageDetails;
  StyledVideoModel? videoDetails;
  V2ClickAction? clickAction;
  SectionBackground? background;
  String? borderColor;
  List<int>? borderRadius;
  List<int>? padding;

  StyledComponentModel({
    required this.type,
    this.textDetails,
    this.imageDetails,
    this.videoDetails,
    this.clickAction,
    this.background,
    this.borderColor,
    this.borderRadius,
    this.padding,
  });

  StyledComponentModel copyWith({
    StyledComponentEnum? type,
    V2StyledTextModel? textDetails,
    StyledImageModel? imageDetails,
    StyledVideoModel? videoDetails,
    V2ClickAction? clickAction,
    SectionBackground? background,
    String? borderColor,
    List<int>? borderRadius,
    List<int>? padding,
  }) {
    return StyledComponentModel(
      type: type ?? this.type,
      textDetails: textDetails ?? this.textDetails,
      imageDetails: imageDetails ?? this.imageDetails,
      videoDetails: videoDetails ?? this.videoDetails,
      clickAction: clickAction ?? this.clickAction,
      background: background ?? this.background,
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type.name,
      'textDetails': textDetails?.toMap(),
      'imageDetails': imageDetails?.toMap(),
      'videoDetails': videoDetails?.toMap(),
      'clickAction': clickAction?.toMap(),
      'background': background?.toMap(),
      'borderColor': borderColor,
      'borderRadius': borderRadius,
      'padding': padding,
    };
  }

  factory StyledComponentModel.fromMap(Map<String, dynamic> map) {
    return StyledComponentModel(
      type: CommonHelpers.enumFromString(
        StyledComponentEnum.values,
        map['type'],
      )!,
      textDetails: map['textDetails'] != null
          ? V2StyledTextModel.fromMap(map['textDetails'])
          : null,
      imageDetails: map['imageDetails'] != null
          ? StyledImageModel.fromMap(map['imageDetails'])
          : null,
      videoDetails: map['videoDetails'] != null
          ? StyledVideoModel.fromMap(map['videoDetails'])
          : null,
      clickAction: map['clickAction'] != null
          ? V2ClickAction.fromMap(map['clickAction'])
          : null,
      background: map['background'] != null
          ? SectionBackground.fromMap(map['background'])
          : null,
      borderColor: map['borderColor'],
      borderRadius: map['borderRadius'] == null
          ? <int>[]
          : List<int>.from(map['borderRadius']),
      padding:
          map['padding'] == null ? <int>[] : List<int>.from(map['padding']),
    );
  }
}

enum StyledComponentEnum {
  TEXT,
  IMAGE,
  VIDEO,
}
