import 'package:yc_app_utils/models/styled_component/styled_circular_progress.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_linear_progress.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_lottie.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_timer.model.dart';
import 'package:yc_app_utils/yc_app_utils.dart';
import 'package:yc_app_utils/models/styled_component/v3_styled_text.model.dart';

class StyledComponentModel with BootstrapSectionUnion, BootstrapChildUnion {
  StyledComponentUnion scData;
  String? uniqueKey;
  V2ClickAction? clickAction;
  SectionBackground? background;
  String? borderColor;
  List<int>? borderRadius;
  List<int>? padding;

  StyledComponentModel({
    required this.scData,
    this.uniqueKey,
    this.clickAction,
    this.background,
    this.borderColor,
    this.borderRadius,
    this.padding,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> scDataMap = {};
    switch (scData.runtimeType) {
      case V2StyledTextModel:
        scDataMap = (scData as V2StyledTextModel).toMap();
        break;
      case StyledImageModel:
        scDataMap = (scData as StyledImageModel).toMap();
        break;
      case StyledVideoModel:
        scDataMap = (scData as StyledImageModel).toMap();
        break;
      default:
    }
    return {
      'scData': scDataMap,
      'clickAction': clickAction?.toMap(),
      'background': background?.toMap(),
      'borderColor': borderColor,
      'borderRadius': borderRadius,
      'padding': padding,
    };
  }

  factory StyledComponentModel.fromMap(Map<String, dynamic> map) {
    StyledComponentUnion? scData;
    switch (map['scData']['__typename']) {
      case 'V2StyledText':
        scData = V2StyledTextModel.fromMap(map['scData']);
        break;
      case 'StyledImage':
        scData = StyledImageModel.fromMap(map['scData']);
        break;
      case 'StyledVideo':
        scData = StyledVideoModel.fromMap(map['scData']);
        break;
      case 'StyledLottie':
        scData = StyledLottieModel.fromMap(map['scData']);
        break;
      case 'StyledTimer':
        scData = StyledTimerModel.fromMap(map['scData']);
        break;
      case 'StyledCircularProgress':
        scData = StyledCircularProgress.fromMap(map['scData']);
        break;
      case 'StyledLinearProgress':
        scData = StyledLinearProgress.fromMap(map['scData']);
        break;
      case 'V3StyledText':
        scData = V3StyledTextModel.fromMap(map['scData']);
        break;
      default:
    }
    return StyledComponentModel(
      scData: scData!,
      uniqueKey: map["uniqueKey"],
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
