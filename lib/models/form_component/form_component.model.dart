import 'package:yc_app_utils/yc_app_utils.dart';

class FormComponentModel with V2GSColumnDataWidgetModel {
  FormComponentEnum fcType;
  StyledInputFieldModel? inputField;
  StyledTextAreaFieldModel? textAreaField;
  StyledRadioFieldModel? radioField;
  StyledCheckboxFieldModel? checkboxField;
  StyledSelectFieldModel? selectField;
  SectionBackground? background;
  String? borderColor;
  List<int>? borderRadius;
  List<int>? padding;

  FormComponentModel({
    required this.fcType,
    this.inputField,
    this.textAreaField,
    this.radioField,
    this.checkboxField,
    this.selectField,
    this.background,
    this.borderColor,
    this.borderRadius,
    this.padding,
  });

  Map<String, dynamic> toMap() {
    return {
      'fcType': fcType.name,
      'inputField': inputField?.toMap(),
      'textAreaField': textAreaField?.toMap(),
      'radioField': radioField?.toMap(),
      'checkboxField': checkboxField?.toMap(),
      'selectField': selectField?.toMap(),
      'background': background?.toMap(),
      'borderColor': borderColor,
      'borderRadius': borderRadius,
      'padding': padding,
    };
  }

  factory FormComponentModel.fromMap(Map<String, dynamic> map) {
    return FormComponentModel(
      fcType: CommonHelpers.enumFromString(
        FormComponentEnum.values,
        map['fcType'],
      )!,
      inputField: map['inputField'] != null
          ? StyledInputFieldModel.fromMap(map['inputField'])
          : null,
      textAreaField: map['textAreaField'] != null
          ? StyledTextAreaFieldModel.fromMap(map['textAreaField'])
          : null,
      radioField: map['radioField'] != null
          ? StyledRadioFieldModel.fromMap(map['radioField'])
          : null,
      checkboxField: map['checkboxField'] != null
          ? StyledCheckboxFieldModel.fromMap(map['checkboxField'])
          : null,
      selectField: map['selectField'] != null
          ? StyledSelectFieldModel.fromMap(map['selectField'])
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

enum FormComponentEnum {
  FORM_INPUT,
  FORM_TEXTAREA,
  FORM_RADIO,
  FORM_CHECKBOX,
  FORM_SELECT,
}
