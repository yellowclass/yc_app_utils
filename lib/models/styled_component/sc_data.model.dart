import 'package:yc_app_utils/helpers/helpers.dart';
import 'package:yc_app_utils/models/styled_component/styled_component_union.dart';
import 'package:yc_app_utils/models/styled_component/styled_image.model.dart';
import 'package:yc_app_utils/models/styled_component/v2_styled_text.model.dart';

class SCDataModel {
  StyledComponentEnum scType;
  StyledComponentUnion? data;

  SCDataModel({
    required this.scType,
    required this.data,
  });

  factory SCDataModel.fromMap(Map<String, dynamic> map) {
    switch (map['data']['__typename']) {
      case 'V2StyledText':
        return SCDataModel(
          scType: CommonHelpers.enumFromString(
            StyledComponentEnum.values,
            map['scType'],
          )!,
          data: V2StyledTextModel.fromMap(map['data']),
        );
      case 'StyledImage':
        return SCDataModel(
          scType: CommonHelpers.enumFromString(
            StyledComponentEnum.values,
            map['scType'],
          )!,
          data: StyledImageModel.fromMap(map['data']),
        );
      default:
        return SCDataModel(
          scType: CommonHelpers.enumFromString(
            StyledComponentEnum.values,
            map['scType'],
          )!,
          data: null,
        );
    }
  }
}

enum StyledComponentEnum {
  TEXT,
  IMAGE,
  VIDEO,
}
