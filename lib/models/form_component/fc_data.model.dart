import 'package:yc_app_utils/helpers/helpers.dart';
import 'package:yc_app_utils/models/form_component/form_component_union.model.dart';
import 'package:yc_app_utils/models/form_component/styled_checkbox_field.model.dart';
import 'package:yc_app_utils/models/form_component/styled_input_field.model.dart';
import 'package:yc_app_utils/models/form_component/styled_radio_field.model.dart';
import 'package:yc_app_utils/models/form_component/styled_select_field.model.dart';

class FCDataModel {
  FormComponentEnum fcType;
  FormComponentUnion? data;

  FCDataModel({
    required this.fcType,
    this.data,
  });

  Map<String, dynamic> toMap() {
    return {
      'fcType': fcType.name,
      // 'data': data?.toMap(),
    };
  }

  factory FCDataModel.fromMap(Map<String, dynamic> map) {
    switch (map['data']['__typename']) {
      case 'StyledInputField':
        return FCDataModel(
          fcType: CommonHelpers.enumFromString(
            FormComponentEnum.values,
            map['fcType'],
          )!,
          data: StyledInputFieldModel.fromMap(
            map['data'],
          ),
        );
      case 'StyledRadioField':
        return FCDataModel(
          fcType: CommonHelpers.enumFromString(
            FormComponentEnum.values,
            map['fcType'],
          )!,
          data: StyledRadioFieldModel.fromMap(
            map['data'],
          ),
        );
      case 'StyledCheckboxField':
        return FCDataModel(
          fcType: CommonHelpers.enumFromString(
            FormComponentEnum.values,
            map['fcType'],
          )!,
          data: StyledCheckboxFieldModel.fromMap(
            map['data'],
          ),
        );
      case 'StyledSelectField':
        return FCDataModel(
          fcType: CommonHelpers.enumFromString(
            FormComponentEnum.values,
            map['fcType'],
          )!,
          data: StyledSelectFieldModel.fromMap(
            map['data'],
          ),
        );
      default:
        return FCDataModel(
          fcType: CommonHelpers.enumFromString(
            FormComponentEnum.values,
            map['fcType'],
          )!,
          data: null,
        );
    }
  }
}

enum FormComponentEnum {
  FORM_INPUT,
  FORM_TEXTAREA,
  FORM_RADIO,
  FORM_CHECKBOX,
  FORM_SELECT,
}
