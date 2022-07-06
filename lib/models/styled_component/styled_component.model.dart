import 'package:yc_app_utils/yc_app_utils.dart';

class StyledComponentModel with BootstrapSectionUnion, BootstrapChildUnion {
  StyledComponentUnion scData;
  V2ClickAction? clickAction;
  SectionBackground? background;
  String? borderColor;
  List<int>? borderRadius;
  List<int>? padding;

  StyledComponentModel({
    required this.scData,
    this.clickAction,
    this.background,
    this.borderColor,
    this.borderRadius,
    this.padding,
  });

  Map<String, dynamic> toMap() {
    return {
      'clickAction': clickAction?.toMap(),
      'background': background?.toMap(),
      'borderColor': borderColor,
      'borderRadius': borderRadius,
      'padding': padding,
    };
  }

  factory StyledComponentModel.fromMap(Map<String, dynamic> map) {
    StyledComponentUnion? scData;
    switch (map['__typename']) {
      case 'V2StyledText':
        scData = V2StyledTextModel.fromMap(map['scData']);
        break;
      case 'StyledImage':
        scData = StyledImageModel.fromMap(map['scData']);
        break;
      default:
    }
    return StyledComponentModel(
      scData: scData!,
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
