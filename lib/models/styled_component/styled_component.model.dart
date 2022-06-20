import 'package:yc_app_utils/helpers/common_helpers.dart';

import 'package:yc_app_utils/models/section_background/section_background.model.dart';
import 'package:yc_app_utils/models/styled_component/generic_button_v3.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_checkbox_field.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_image.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_input_field.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_radio_field.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_select_field.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_text_area_field.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_video.model.dart';
import 'package:yc_app_utils/models/styled_component/v2_styled_text.model.dart';

class StyledComponent {
  StyledComponentEnum type;
  StyledInputField? inputField;
  StyledTextAreaField? textAreaField;
  StyledRadioField? radioField;
  StyledCheckboxField? checkboxField;
  StyledSelectField? selectField;
  V2StyledText? textDetails;
  StyledImage? imageDetails;
  StyledVideo? videoDetails;
  GenericButtonV3Model? buttonDetails;
  SectionBackground? background;
  String? borderColor;
  List<int>? borderRadius;
  List<int>? padding;

  StyledComponent({
    required this.type,
    this.inputField,
    this.textAreaField,
    this.radioField,
    this.checkboxField,
    this.selectField,
    this.textDetails,
    this.imageDetails,
    this.videoDetails,
    this.buttonDetails,
    this.background,
    this.borderColor,
    this.borderRadius,
    this.padding,
  });

  StyledComponent copyWith({
    StyledComponentEnum? type,
    StyledInputField? inputField,
    StyledTextAreaField? textAreaField,
    StyledRadioField? radioField,
    StyledCheckboxField? checkboxField,
    StyledSelectField? selectField,
    V2StyledText? textDetails,
    StyledImage? imageDetails,
    StyledVideo? videoDetails,
    GenericButtonV3Model? buttonDetails,
    SectionBackground? background,
    String? borderColor,
    List<int>? borderRadius,
    List<int>? padding,
  }) {
    return StyledComponent(
      type: type ?? this.type,
      inputField: inputField ?? this.inputField,
      textAreaField: textAreaField ?? this.textAreaField,
      radioField: radioField ?? this.radioField,
      checkboxField: checkboxField ?? this.checkboxField,
      selectField: selectField ?? this.selectField,
      textDetails: textDetails ?? this.textDetails,
      imageDetails: imageDetails ?? this.imageDetails,
      videoDetails: videoDetails ?? this.videoDetails,
      buttonDetails: buttonDetails ?? this.buttonDetails,
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
      'textDetails': textDetails?.toMap(),
      'imageDetails': imageDetails?.toMap(),
      'videoDetails': videoDetails?.toMap(),
      'buttonDetails': buttonDetails?.toMap(),
      'background': background?.toMap(),
      'borderColor': borderColor,
      'borderRadius': borderRadius,
      'padding': padding,
    };
  }

  factory StyledComponent.fromMap(Map<String, dynamic> map) {
    return StyledComponent(
      type: CommonHelpers.enumFromString(
        StyledComponentEnum.values,
        map['type'],
      )!,
      inputField: map['inputField'] != null
          ? StyledInputField.fromMap(map['inputField'])
          : null,
      textAreaField: map['textAreaField'] != null
          ? StyledTextAreaField.fromMap(map['textAreaField'])
          : null,
      radioField: map['radioField'] != null
          ? StyledRadioField.fromMap(map['radioField'])
          : null,
      checkboxField: map['checkboxField'] != null
          ? StyledCheckboxField.fromMap(map['checkboxField'])
          : null,
      selectField: map['selectField'] != null
          ? StyledSelectField.fromMap(map['selectField'])
          : null,
      textDetails: map['textDetails'] != null
          ? V2StyledText.fromMap(map['textDetails'])
          : null,
      imageDetails: map['imageDetails'] != null
          ? StyledImage.fromMap(map['imageDetails'])
          : null,
      videoDetails: map['videoDetails'] != null
          ? StyledVideo.fromMap(map['videoDetails'])
          : null,
      buttonDetails: map['buttonDetails'] != null
          ? GenericButtonV3Model.fromMap(map['buttonDetails'])
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
  FORM_INPUT,
  FORM_TEXTAREA,
  FORM_RADIO,
  FORM_CHECKBOX,
  FORM_SELECT,
  TEXT,
  IMAGE,
  VIDEO,
  BUTTON,
}
