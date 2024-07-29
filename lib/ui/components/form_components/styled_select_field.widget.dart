import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class StyledSelectFieldWidget extends StatefulWidget {
  const StyledSelectFieldWidget({
    required this.selectFieldData,
    this.onSaved,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  final StyledSelectFieldModel selectFieldData;
  final void Function(String, List<String>?)? onSaved;
  final void Function(String, List<String>?)? onChanged;

  @override
  State<StyledSelectFieldWidget> createState() =>
      _StyledSelectFieldWidgetState();
}

class _StyledSelectFieldWidgetState extends State<StyledSelectFieldWidget> {
  List<OptionModel> get selectedValues =>
      widget.selectFieldData.selectDefaultValue ?? [];

  final ValueNotifier<bool> suffixIconVisibility = ValueNotifier(false);

  Widget _getDropDownIcon() {
    return Row(
      children: List.generate(
        widget.selectFieldData.dropdownIcon?.length ?? 0,
        (index) {
          return Padding(
            padding: const EdgeInsets.only(right: AppSpacing.xs),
            child: (widget.selectFieldData.dropdownIcon?[index].id ==
                    "validate_icon")
                ? ValueListenableBuilder(
                    valueListenable: suffixIconVisibility,
                    builder: (context, value, _) {
                      return (value == true &&
                              widget.selectFieldData.dropdownIcon?[index].url !=
                                  null)
                          ? GenericNetworkImage(
                              widget.selectFieldData.dropdownIcon![index].url!,
                              width: widget
                                  .selectFieldData.dropdownIcon?[index].width,
                            )
                          : const SizedBox();
                    },
                  )
                : widget.selectFieldData.dropdownIcon?[index].url != null
                    ? GenericNetworkImage(
                        widget.selectFieldData.dropdownIcon![index].url!,
                        width:
                            widget.selectFieldData.dropdownIcon?[index].width,
                      )
                    : const SizedBox(),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    suffixIconVisibility.value =
        widget.selectFieldData.selectDefaultValue != null &&
            CommonHelpers.validateSelectCheckField(
                  values: widget.selectFieldData.selectDefaultValue != null
                      ? widget.selectFieldData.selectDefaultValue!
                      : [],
                  validations: widget.selectFieldData.validation,
                ) ==
                null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.selectFieldData.label != null) ...{
          Row(
            children: [
              V2StyledTextWidget(
                styledText: widget.selectFieldData.label!,
              ),
              if (widget.selectFieldData.validation?.isRequired?.value == true)
                const Text(
                  ' *',
                  style: TextStyle(
                    color: AppColors.cRed_100,
                  ),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.xxs),
        },
        if (widget.selectFieldData.selectType == SelectType.SINGLE)
          if (widget.selectFieldData.useSearchableWidget ??
              widget.selectFieldData.isSearchable)
            DropdownSearch<OptionModel>(
              mode: Mode.MENU,
              showSelectedItems: true,
              popupShape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              showSearchBox: widget.selectFieldData.isSearchable,
              dropDownButton: const SizedBox.shrink(),
              popupItemBuilder: (context, item, isSelected) =>
                  CommonHelpers.getV2StyledTextWidgetFromTextStyle(
                text: item.label,
                textStyle: widget.selectFieldData.optionStyle
                    ?.copyWith(textColor: isSelected ? 'FFFF7100' : null),
              ),
              scrollbarProps: ScrollbarProps(
                isAlwaysShown: true,
                thickness: 6,
                radius: Radius.circular(12),
              ),
              dropdownBuilder: (context, selectedItem) => Text(
                selectedItem?.label ??
                    widget.selectFieldData.inputDecoration?.hintText ??
                    '',
                style: (selectedItem?.label != null
                    ? widget.selectFieldData.textStyle
                    : widget.selectFieldData.inputDecoration?.hintStyle),
              ),
              items: widget.selectFieldData.options,
              enabled: !widget.selectFieldData.isDisabled,
              onChanged: (value) {
                suffixIconVisibility.value =
                    CommonHelpers.validateSelectCheckField(
                          values: value != null ? [value] : [],
                          validations: widget.selectFieldData.validation,
                        ) ==
                        null;
                List<String> data = value?.value != null ? [value!.value] : [];
                widget.onChanged?.call(widget.selectFieldData.name, data);
              },
              maxHeight: widget.selectFieldData.maxHeight,
              searchFieldProps: TextFieldProps(
                decoration: InputDecoration(
                  hintText: widget.selectFieldData.hintText,
                  prefixIcon: widget.selectFieldData.leadingIcon != null
                      ? Padding(
                          padding: const EdgeInsets.all(8),
                          child: GenericNetworkImage(
                            widget.selectFieldData.leadingIcon!,
                            width: 2,
                            height: 2,
                          ),
                        )
                      : null,
                  border: const OutlineInputBorder(),
                ),
              ),
              dropdownButtonBuilder: (context) => _getDropDownIcon(),
              dropdownSearchDecoration:
                  widget.selectFieldData.inputDecoration ??
                      InputDecoration(
                        hintText: widget.selectFieldData.placeholder,
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
                validations: widget.selectFieldData.validation,
              ),
              onSaved: (value) {
                List<String> data = value?.value != null ? [value!.value] : [];
                widget.onSaved?.call(widget.selectFieldData.name, data);
              },
            )
          else
            DropdownButtonFormField<OptionModel>(
              style: widget.selectFieldData.textStyle,
              value: widget.selectFieldData.selectDefaultValue?[0],
              items: List<DropdownMenuItem<OptionModel>>.from(
                widget.selectFieldData.options.map(
                  (option) => DropdownMenuItem<OptionModel>(
                    value: option,
                    child: Text(option.label),
                  ),
                ),
              ),
              icon: _getDropDownIcon(),
              borderRadius: BorderRadius.circular(10),
              onChanged: widget.selectFieldData.isDisabled
                  ? null
                  : (value) {
                      suffixIconVisibility.value =
                          CommonHelpers.validateSelectCheckField(
                                values: value != null ? [value] : [],
                                validations: widget.selectFieldData.validation,
                              ) ==
                              null;
                      List<String> data =
                          value?.value != null ? [value!.value] : [];
                      widget.onChanged?.call(
                        widget.selectFieldData.name,
                        data,
                      );
                    },
              decoration: widget.selectFieldData.inputDecoration ??
                  const InputDecoration(),
              validator: (value) => CommonHelpers.validateSelectCheckField(
                values: value != null ? [value] : [],
                validations: widget.selectFieldData.validation,
              ),
              onSaved: (value) {
                List<String> data = value?.value != null ? [value!.value] : [];
                widget.onSaved?.call(widget.selectFieldData.name, data);
              },
            )
        else
          DropdownSearch<OptionModel>.multiSelection(
            mode: Mode.MENU,
            showSelectedItems: true,
            showSearchBox: widget.selectFieldData.isSearchable,
            dropDownButton: const SizedBox.shrink(),
            items: widget.selectFieldData.options,
            enabled: !widget.selectFieldData.isDisabled,
            dropdownSearchDecoration: widget.selectFieldData.inputDecoration ??
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
              validations: widget.selectFieldData.validation,
            ),
            onSaved: (value) {
              widget.onSaved?.call(
                widget.selectFieldData.name,
                value?.map((v) => v.value).toList(),
              );
            },
          )
      ],
    );
  }
}
