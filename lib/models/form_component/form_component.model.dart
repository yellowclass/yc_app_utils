import 'package:yc_app_utils/yc_app_utils.dart';

class FormComponentModel with V2GSColumnDataWidgetModel {
  FormComponentEnum type;
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
    required this.type,
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

  FormComponentModel copyWith({
    FormComponentEnum? type,
    StyledInputFieldModel? inputField,
    StyledTextAreaFieldModel? textAreaField,
    StyledRadioFieldModel? radioField,
    StyledCheckboxFieldModel? checkboxField,
    StyledSelectFieldModel? selectField,
    SectionBackground? background,
    String? borderColor,
    List<int>? borderRadius,
    List<int>? padding,
  }) {
    return FormComponentModel(
      type: type ?? this.type,
      inputField: inputField ?? this.inputField,
      textAreaField: textAreaField ?? this.textAreaField,
      radioField: radioField ?? this.radioField,
      checkboxField: checkboxField ?? this.checkboxField,
      selectField: selectField ?? this.selectField,
      background: background ?? this.background,
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius ?? this.borderRadius,
      padding: padding ?? this.padding,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type.name,
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
      type: CommonHelpers.enumFromString(
        FormComponentEnum.values,
        map['type'],
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
