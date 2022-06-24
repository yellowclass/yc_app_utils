import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/helpers.dart';
import 'package:yc_app_utils/models/models.dart';
import 'package:yc_app_utils/models/styled_component/option.model.dart';

import 'package:yc_app_utils/models/styled_component/styled_select_field.model.dart';
import 'package:yc_app_utils/ui/components/styled_components/v2_styled_text.widget.dart';
import 'package:yc_app_utils/ui/styleguide/colors.dart';
import 'package:yc_app_utils/ui/styleguide/spacing.dart';

class StyledSelectFieldWidget extends StatefulWidget {
  const StyledSelectFieldWidget({
    required this.selectFieldData,
    Key? key,
  }) : super(key: key);

  final StyledSelectFieldModel selectFieldData;

  @override
  State<StyledSelectFieldWidget> createState() =>
      _StyledSelectFieldWidgetState();
}

class _StyledSelectFieldWidgetState extends State<StyledSelectFieldWidget> {
  List<OptionModel> selectedValues = [];

  @override
  void initState() {
    selectedValues = widget.selectFieldData.defaultValue ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.selectFieldData.label != null)
          V2StyledTextWidget(
            styledText: widget.selectFieldData.label!,
          ),
        if (widget.selectFieldData.selectType == SelectType.SINGLE)
          DropdownSearch<OptionModel>(
            mode: Mode.MENU,
            showSelectedItems: true,
            showSearchBox: widget.selectFieldData.isSearchable,
            dropDownButton: const SizedBox.shrink(),
            items: widget.selectFieldData.options,
            enabled: !widget.selectFieldData.isDisabled,
            dropdownSearchDecoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: AppSpacing.s,
              ),
              suffixIcon: Container(
                padding: const EdgeInsets.all(
                  AppSpacing.s,
                ),
                child: const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.cBODY_TEXT,
                ),
              ),
            ),
            selectedItem: selectedValues.isNotEmpty ? selectedValues[0] : null,
            itemAsString: (item) => item!.label,
            compareFn: (item, selectedItem) =>
                item!.value == selectedItem!.value,
            onChanged: (item) {
              setState(() {
                // isClassSelected = true;
                // profileInput.classStandard = item!.value;
              });
            },
            validator: (value) => CommonHelpers.validateSelectField(
              values: value != null ? [value] : [],
              validations: widget.selectFieldData.validate,
            ),
          )
        else
          DropdownSearch<OptionModel>.multiSelection(
            mode: Mode.MENU,
            showSelectedItems: true,
            showSearchBox: widget.selectFieldData.isSearchable,
            dropDownButton: const SizedBox.shrink(),
            items: widget.selectFieldData.options,
            enabled: !widget.selectFieldData.isDisabled,
            dropdownSearchDecoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: AppSpacing.s,
              ),
              suffixIcon: Container(
                padding: const EdgeInsets.all(
                  AppSpacing.s,
                ),
                child: const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.cBODY_TEXT,
                ),
              ),
            ),
            selectedItems: selectedValues,
            itemAsString: (item) => item!.label,
            compareFn: (item, selectedItem) =>
                item!.value == selectedItem!.value,
            onChanged: (item) {
              setState(() {
                // isClassSelected = true;
                // profileInput.classStandard = item!.value;
              });
            },
            validator: (values) => CommonHelpers.validateSelectField(
              values: values!,
              validations: widget.selectFieldData.validate,
            ),
          )
      ],
    );
  }
}

// class _RadioGrp extends FormField<String?> {
//   _RadioGrp({
//     required super.builder,
//     required super.validator,
//   });
// }
