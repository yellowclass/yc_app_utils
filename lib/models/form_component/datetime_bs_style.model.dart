import 'package:yc_app_utils/models/section_background/section_background.model.dart';
import 'package:yc_app_utils/models/styled_component/styled_component_model.import.dart';

class DateTimeBottomSheetStyle {
  final V2StyledTextModel labelText;
  final double height;
  final GenericButtonV3Model? bottomStickyBar;
  final SectionBackground? bottomSheetBackground;

  DateTimeBottomSheetStyle({
    required this.labelText,
    required this.height,
    this.bottomStickyBar,
    this.bottomSheetBackground,
  });

  DateTimeBottomSheetStyle copyWith({
    V2StyledTextModel? labelText,
    double? height,
    GenericButtonV3Model? bottomStickyBar,
    SectionBackground? bottomSheetBackground,
  }) {
    return DateTimeBottomSheetStyle(
      labelText: labelText ?? this.labelText,
      height: height ?? this.height,
      bottomStickyBar: bottomStickyBar ?? this.bottomStickyBar,
      bottomSheetBackground:
          bottomSheetBackground ?? this.bottomSheetBackground,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'labelText': labelText.toMap(),
      'height': height,
      'bottomStickyBar': bottomStickyBar?.toMap(),
    };
  }

  factory DateTimeBottomSheetStyle.fromMap(Map<String, dynamic> map) {
    return DateTimeBottomSheetStyle(
      labelText: V2StyledTextModel.fromMap(map['labelText']),
      height: double.tryParse(map['height'] ?? '') ?? 0,
      bottomStickyBar: map['bottomStickyBar'] != null
          ? GenericButtonV3Model.fromMap(map['bottomStickyBar'])
          : null,
      bottomSheetBackground: map['bottomSheetBackground'] != null
          ? SectionBackground.fromMap(map['bottomSheetBackground'])
          : null,
    );
  }
}
