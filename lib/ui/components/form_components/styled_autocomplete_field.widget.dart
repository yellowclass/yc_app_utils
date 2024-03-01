import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:yc_app_utils/models/autocomplete_suggestion/autocomplete_field_data.model.dart';
import 'package:yc_app_utils/models/autocomplete_suggestion/autocomplete_input.model.dart';
import 'package:yc_app_utils/models/autocomplete_suggestion/autocomplete_suggestions.model.dart';
import 'package:yc_app_utils/models/form_component/styled_autocomplete_field.model.dart';
import 'package:yc_app_utils/yc_app_utils.dart';
import 'package:collection/collection.dart';

class StyledAutocompleteFieldWidget extends StatefulWidget {
  const StyledAutocompleteFieldWidget({
    required this.autocompleteFieldData,
    this.onSaved,
    this.getAutoCompleteSuggestions,
    Key? key,
  }) : super(key: key);

  final StyledAutoCompleteFieldModel autocompleteFieldData;
  final void Function(String, Map<String, dynamic>?)? onSaved;
  final Future<AutocompleteSuggestions?> Function(
      AutocompleteInputModel inputData)? getAutoCompleteSuggestions;

  @override
  State<StyledAutocompleteFieldWidget> createState() =>
      _StyledAutocompleteFieldWidgetState();
}

class _StyledAutocompleteFieldWidgetState
    extends State<StyledAutocompleteFieldWidget> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController controller = TextEditingController();
  late final ScrollController _scrollController;
  String? lastSearchedValue;
  List<AutocompleteFieldData> _suggestions = [];
  List<AutocompleteFieldData> _lastSuggestions = [];

  Timer? debouncer;

  TextInputType? getKeyboardType(InputFieldEnum? fieldType) {
    switch (fieldType) {
      case InputFieldEnum.EMAIL:
        return TextInputType.emailAddress;
      case InputFieldEnum.TEXT:
        return TextInputType.text;
      case InputFieldEnum.NUMBER:
        return TextInputType.number;
      case InputFieldEnum.MOBILE:
        return TextInputType.phone;
      default:
        return null;
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  void fetchSuggestions(String input) async {
    if (debouncer?.isActive ?? false) {
      debouncer?.cancel();
    }
    debouncer = Timer(const Duration(milliseconds: 800), () async {
      lastSearchedValue = input;
      _lastSuggestions = (await widget.getAutoCompleteSuggestions?.call(
            AutocompleteInputModel(
              input: input,
              autocompleteType: widget.autocompleteFieldData.autocompleteType,
              miscParams: widget.autocompleteFieldData.miscParams,
            ),
          ))
              ?.suggestions ??
          [];
      _suggestions = _lastSuggestions;
      controller.notifyListeners();
      lastSearchedValue = null;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CommonHelpers.getPaddingFromList(
        widget.autocompleteFieldData.padding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.autocompleteFieldData.label != null) ...{
            Row(
              children: [
                Flexible(
                  child: V2StyledTextWidget(
                    styledText: widget.autocompleteFieldData.label!,
                  ),
                ),
                if (widget
                        .autocompleteFieldData.validation?.isRequired?.value ==
                    true)
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
          LayoutBuilder(builder: (context, constraints) {
            return RawAutocomplete<AutocompleteFieldData>(
              textEditingController: controller,
              focusNode: _focusNode,
              optionsBuilder: (TextEditingValue textEditingValue) async {
                String input = textEditingValue.text;

                if (input == lastSearchedValue) {
                  return _suggestions;
                }
                _suggestions = [];
                if (input.length < 3) {
                  return _suggestions;
                }

                fetchSuggestions(input);
                return _suggestions;
              },
              fieldViewBuilder: (
                BuildContext context,
                TextEditingController textEditingController,
                FocusNode focusNode,
                VoidCallback onFieldSubmitted,
              ) {
                return FormBuilderTextField(
                  controller: textEditingController,
                  focusNode: focusNode,
                  name: widget.autocompleteFieldData.name,
                  onSaved: (value) {
                    final selectedSuggestion =
                        _lastSuggestions.firstWhereOrNull(
                            (suggestion) => suggestion.inputText == value);

                    widget.onSaved?.call(
                      widget.autocompleteFieldData.name,
                      selectedSuggestion?.toMap(),
                    );
                  },
                  validator: (value) => CommonHelpers.validateAutocompleteField(
                    value: value ?? '',
                    validations: widget.autocompleteFieldData.validation,
                    label: widget.autocompleteFieldData.label?.text,
                    lastSuggestions: _lastSuggestions,
                  ),
                  cursorColor: AppColors.cTANGERINE_100,
                  initialValue:
                      widget.autocompleteFieldData.autoCompleteDefaultValue,
                  enabled: !widget.autocompleteFieldData.isDisabled,
                  textAlignVertical: TextAlignVertical.bottom,
                  minLines: widget.autocompleteFieldData.isExpanded ? null : 1,
                  decoration: widget.autocompleteFieldData.inputDecoration ??
                      const InputDecoration(),
                  style: widget.autocompleteFieldData.textStyle ??
                      const TextStyle(
                        color: AppColors.cBODY_TEXT,
                        fontSize: 16,
                      ),
                );
              },
              displayStringForOption: (option) => option.inputText,
              optionsViewBuilder: (context, onSelected, options) {
                return Align(
                  alignment: Alignment.topLeft,
                  child: Material(
                    elevation: 4.0,
                    child: Container(
                      constraints: BoxConstraints(
                        maxHeight:
                            widget.autocompleteFieldData.optionsViewHeight ??
                                double.infinity,
                      ),
                      width: constraints.biggest.width,
                      child: Scrollbar(
                        thumbVisibility: true,
                        controller: _scrollController,
                        child: ListView.separated(
                          controller: _scrollController,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) => const Divider(
                            color: AppColors.cBLACK_05,
                            height: AppSpacing.m,
                            thickness: 2,
                          ),
                          padding: const EdgeInsets.all(8.0),
                          itemCount: options.length,
                          itemBuilder: (BuildContext context, int index) {
                            final option = options.elementAt(index);
                            return GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                onSelected(option);
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: option.texts
                                    .map(
                                      (styledText) => V2StyledTextWidget(
                                        styledText: styledText,
                                      ),
                                    )
                                    .toList(),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }

  @override
  void dispose() {
    debouncer?.cancel();
    super.dispose();
  }
}
