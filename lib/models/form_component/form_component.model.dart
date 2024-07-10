import 'package:yc_app_utils/models/form_component/styled_autocomplete_field.model.dart';
import 'package:yc_app_utils/models/form_component/styled_points_picker.model.dart';
import 'package:yc_app_utils/models/form_component/styled_rating_slider.model.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class FormComponentModel with BootstrapChildUnion {
  FormComponentUnion? fcData;
  SectionBackground? background;
  String? borderColor;
  List<int>? borderRadius;
  List<int>? padding;

  FormComponentModel({
    this.fcData,
    this.background,
    this.borderColor,
    this.borderRadius,
    this.padding,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> fcDataMap = {};
    switch (fcData.runtimeType) {
      case StyledInputFieldModel:
        fcDataMap = (fcData as StyledInputFieldModel).toMap();
        break;
      case StyledDateTimeFieldModel:
        fcDataMap = (fcData as StyledDateTimeFieldModel).toMap();
        break;
      case StyledRadioFieldModel:
        fcDataMap = (fcData as StyledRadioFieldModel).toMap();
        break;
      case StyledCheckboxFieldModel:
        fcDataMap = (fcData as StyledCheckboxFieldModel).toMap();
        break;
      case StyledSelectFieldModel:
        fcDataMap = (fcData as StyledSelectFieldModel).toMap();
        break;
      case StyledAutoCompleteFieldModel:
        fcDataMap = (fcData as StyledAutoCompleteFieldModel).toMap();
        break;
      default:
    }
    return {
      'fcData': fcDataMap,
      'background': background?.toMap(),
      'borderColor': borderColor,
      'borderRadius': borderRadius,
      'padding': padding,
    };
  }

  factory FormComponentModel.fromMap(Map<String, dynamic> map) {
    FormComponentUnion? fcData;
    switch (map['fcData']['__typename']) {
      case 'StyledInputField':
        fcData = StyledInputFieldModel.fromMap(
          map['fcData'],
        );
        break;
      case 'StyledDateTimeField':
        fcData = StyledDateTimeFieldModel.fromMap(
          map['fcData'],
        );
        break;
      case 'StyledRadioField':
        fcData = StyledRadioFieldModel.fromMap(
          map['fcData'],
        );
        break;
      case 'StyledCheckboxField':
        fcData = StyledCheckboxFieldModel.fromMap(
          map['fcData'],
        );
        break;
      case 'StyledSelectField':
        fcData = StyledSelectFieldModel.fromMap(
          map['fcData'],
        );
        break;
      case 'StyledAutoCompleteField':
        fcData = StyledAutoCompleteFieldModel.fromMap(
          map['fcData'],
        );
        break;
      case 'StyledRatingSlider':
        fcData = StyledRatingSlider.fromMap(
          map['fcData'],
        );
        break;
      case 'StyledPointsPicker':
        fcData = StyledPointsPickerModel.fromMap(
          map['fcData'],
        );
        break;
      default:
    }
    return FormComponentModel(
      fcData: fcData,
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
