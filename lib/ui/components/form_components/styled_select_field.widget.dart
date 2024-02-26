import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class StyledSelectFieldWidget extends StatelessWidget {
  const StyledSelectFieldWidget({
    required this.selectFieldData,
    this.onSaved,
    Key? key,
  }) : super(key: key);

  final StyledSelectFieldModel selectFieldData;
  final void Function(String, List<String>?)? onSaved;

  List<OptionModel> get selectedValues =>
      selectFieldData.selectDefaultValue ?? [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (selectFieldData.label != null) ...{
          Row(
            children: [
              V2StyledTextWidget(
                styledText: selectFieldData.label!,
              ),
              if (selectFieldData.validation?.isRequired?.value == true)
                const Text(
                  ' *',
                  style: TextStyle(
                    color: AppColors.cRed_100,
                  ),
                ),
            ],
          ),
          SizedBox(height: AppSpacing.xxs),
        },
        if (selectFieldData.selectType == SelectType.SINGLE)
          if (selectFieldData.isSearchable)
            DropdownSearch<OptionModel>(
              mode: Mode.MENU,
              showSelectedItems: true,
              showSearchBox: selectFieldData.isSearchable,
              dropDownButton: const SizedBox.shrink(),
              items: selectFieldData.options,
              enabled: !selectFieldData.isDisabled,
              dropdownSearchDecoration: selectFieldData.inputDecoration ??
                  InputDecoration(
                    hintText: selectFieldData.placeholder,
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
              selectedItem:
                  selectedValues.isNotEmpty ? selectedValues[0] : null,
              itemAsString: (item) => item!.label,
              compareFn: (item, selectedItem) =>
                  item!.value == selectedItem!.value,
              validator: (value) => CommonHelpers.validateSelectCheckField(
                values: value != null ? [value] : [],
                validations: selectFieldData.validation,
              ),
              onSaved: (value) {
                List<String> data = value?.value != null ? [value!.value] : [];
                onSaved?.call(selectFieldData.name, data);
              },
            )
          else
            FormBuilderDropdown<OptionModel>(
              name: selectFieldData.name,
              style: selectFieldData.textStyle,
              items: List<DropdownMenuItem<OptionModel>>.from(
                selectFieldData.options.map(
                  (option) => DropdownMenuItem<OptionModel>(
                    value: option,
                    child: Text(option.label),
                  ),
                ),
              ),
              icon: const SizedBox.shrink(),
              decoration:
                  selectFieldData.inputDecoration ?? const InputDecoration(),
              validator: (value) => CommonHelpers.validateSelectCheckField(
                values: value != null ? [value] : [],
                validations: selectFieldData.validation,
              ),
              onSaved: (value) {
                List<String> data = value?.value != null ? [value!.value] : [];
                onSaved?.call(selectFieldData.name, data);
              },
            )
        else
          DropdownSearch<OptionModel>.multiSelection(
            mode: Mode.MENU,
            showSelectedItems: true,
            showSearchBox: selectFieldData.isSearchable,
            dropDownButton: const SizedBox.shrink(),
            items: selectFieldData.options,
            enabled: !selectFieldData.isDisabled,
            dropdownSearchDecoration: selectFieldData.inputDecoration ??
                InputDecoration(
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
            validator: (values) => CommonHelpers.validateSelectCheckField(
              values: values!,
              validations: selectFieldData.validation,
            ),
            onSaved: (value) {
              onSaved?.call(
                selectFieldData.name,
                value?.map((v) => v.value).toList(),
              );
            },
          )
      ],
    );
  }
}
