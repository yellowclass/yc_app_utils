import 'package:yc_app_utils/models/click_action/v2_click_action.model.dart';
import 'package:yc_app_utils/models/form_component/form_component_union.model.dart';
import 'package:yc_app_utils/models/styled_component/v2_styled_text.model.dart';

class StyledPointsPickerModel with FormComponentUnion {
  String id;
  V2StyledTextModel? topLabel;
  V2StyledTextModel? bottomLabel;
  List<CircularButton>? pickerOptions;

  StyledPointsPickerModel({
    required this.id,
    this.topLabel,
    this.bottomLabel,
    this.pickerOptions,
  });

  factory StyledPointsPickerModel.fromMap(Map<String, dynamic> map) {
    return StyledPointsPickerModel(
      id: map['id'] != null ? map['id'] : null,
      topLabel: map['topLabel'] != null
          ? V2StyledTextModel.fromMap(map['topLabel'])
          : null,
      bottomLabel: map['bottomLabel'] != null
          ? V2StyledTextModel.fromMap(map['bottomLabel'])
          : null,
      pickerOptions: map['pickerOptions'] != null
          ? List<CircularButton>.from(
              map['pickerOptions'].map((item) => CircularButton.fromJson(item)))
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'topLabel': topLabel?.toMap(),
      'bottomLabel': bottomLabel?.toMap(),
      'pickerOptions': pickerOptions?.map((option) => option.toJson()).toList(),
    };
  }
}

class CircularButton {
  String? borderColor;
  V2StyledTextModel? selectComponent;
  V2StyledTextModel? unselectComponent;
  V2ClickAction? onOptionClick;

  CircularButton({
    this.selectComponent,
    this.unselectComponent,
    this.onOptionClick,
    this.borderColor,
  });

  factory CircularButton.fromJson(Map<String, dynamic> json) {
    return CircularButton(
      selectComponent: json['selectComponent'] != null
          ? V2StyledTextModel.fromMap(json['selectComponent'])
          : null,
      unselectComponent: json['unselectComponent'] != null
          ? V2StyledTextModel.fromMap(json['unselectComponent'])
          : null,
      onOptionClick: json['onOptionClick'] != null
          ? V2ClickAction.fromMap(json['onOptionClick'])
          : null,
      borderColor: json['borderColor'] != null ? json['borderColor'] : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'selectComponent': selectComponent?.toMap(),
      'unselectComponent': unselectComponent?.toMap(),
      'onOptionClick': onOptionClick?.toMap(),
      'borderColor': borderColor,
    };
  }
}
