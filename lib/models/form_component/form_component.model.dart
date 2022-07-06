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
    return {
      // 'fcData': fcData?.toMap(),
      'background': background?.toMap(),
      'borderColor': borderColor,
      'borderRadius': borderRadius,
      'padding': padding,
    };
  }

  factory FormComponentModel.fromMap(Map<String, dynamic> map) {
    FormComponentUnion? fcData;
    switch (map['__typename']) {
      case 'StyledInputField':
        fcData = StyledInputFieldModel.fromMap(
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
