import 'package:flutter/material.dart';
import 'package:yc_app_utils/models/autocomplete_suggestion/autocomplete_input.model.dart';
import 'package:yc_app_utils/models/autocomplete_suggestion/autocomplete_suggestions.model.dart';
import 'package:yc_app_utils/models/form_component/styled_autocomplete_field.model.dart';
import 'package:yc_app_utils/models/form_component/styled_points_picker.model.dart';
import 'package:yc_app_utils/models/form_component/styled_rating_slider.model.dart';
import 'package:yc_app_utils/ui/components/form_components/styled_autocomplete_field.widget.dart';
import 'package:yc_app_utils/ui/components/form_components/styled_points_picker.widget.dart';
import 'package:yc_app_utils/ui/components/form_components/styled_rating_slider.widget.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class FormComponentWidget extends StatelessWidget {
  const FormComponentWidget({
    required this.formComponentDetails,
    this.getAutoCompleteSuggestions,
    this.onSaved,
    this.innerClickAction,
    Key? key,
  }) : super(key: key);

  final FormComponentModel formComponentDetails;
  final void Function(String, dynamic)? onSaved;
  final Future<AutocompleteSuggestions?> Function(
      AutocompleteInputModel inputData)? getAutoCompleteSuggestions;

  final InnerClickAction? innerClickAction;

  Widget buildComponent() {
    if (formComponentDetails.fcData is StyledInputFieldModel) {
      StyledInputFieldModel inputFieldDetails =
          formComponentDetails.fcData as StyledInputFieldModel;
      return StyledTextFieldWidget(
        textFieldData: inputFieldDetails,
        onSaved: onSaved,
      );
    } else if (formComponentDetails.fcData is StyledDateTimeFieldModel) {
      StyledDateTimeFieldModel dateTimeFieldDetails =
          formComponentDetails.fcData as StyledDateTimeFieldModel;
      return StyledDateTimeFieldWidget(
        dateTimeFieldData: dateTimeFieldDetails,
        onSaved: onSaved,
        innerClickAction: innerClickAction,
      );
    } else if (formComponentDetails.fcData is StyledRadioFieldModel) {
      StyledRadioFieldModel radioFieldDetails =
          formComponentDetails.fcData as StyledRadioFieldModel;
      return StyledRadioFieldWidget(
        radioFieldData: radioFieldDetails,
        onSaved: onSaved,
      );
    } else if (formComponentDetails.fcData is StyledCheckboxFieldModel) {
      StyledCheckboxFieldModel checkboxFieldDetails =
          formComponentDetails.fcData as StyledCheckboxFieldModel;
      return StyledCheckboxFieldWidget(
        checkboxFieldData: checkboxFieldDetails,
        onSaved: onSaved,
      );
    } else if (formComponentDetails.fcData is StyledSelectFieldModel) {
      StyledSelectFieldModel selectFieldDetails =
          formComponentDetails.fcData as StyledSelectFieldModel;
      return StyledSelectFieldWidget(
        selectFieldData: selectFieldDetails,
        onSaved: onSaved,
      );
    } else if (formComponentDetails.fcData is StyledAutoCompleteFieldModel) {
      StyledAutoCompleteFieldModel autocompleteFieldData =
          formComponentDetails.fcData as StyledAutoCompleteFieldModel;
      return StyledAutocompleteFieldWidget(
        autocompleteFieldData: autocompleteFieldData,
        onSaved: onSaved,
        getAutoCompleteSuggestions: getAutoCompleteSuggestions,
      );
    } else if (formComponentDetails.fcData is StyledRatingSlider) {
      StyledRatingSlider ratingSlider =
          formComponentDetails.fcData as StyledRatingSlider;
      return StyledRatingSliderWidget(
        data: ratingSlider,
        onSaved: onSaved,
      );
    } else if (formComponentDetails.fcData is StyledPointsPickerModel) {
      StyledPointsPickerModel pointsPickerModel =
          formComponentDetails.fcData as StyledPointsPickerModel;
      return PointsPickerWidget(
        pointsPickerdata: pointsPickerModel,
        onItemSelected: (index) {
          onSaved?.call(pointsPickerModel.id, index);
        },
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CommonHelpers.getPaddingFromList(
        formComponentDetails.padding,
      ),
      decoration: CommonHelpers.getBoxDecorationWithSectionBackground(
        sectionBackground: formComponentDetails.background,
      ).copyWith(
        borderRadius: CommonHelpers.getBorderRadiusFromList(
          formComponentDetails.borderRadius,
        ),
        border: formComponentDetails.borderColor != null
            ? Border.all(
                color: CommonHelpers.v2ColorFromHex(
                  formComponentDetails.borderColor,
                ),
              )
            : null,
      ),
      child: buildComponent(),
    );
  }
}
