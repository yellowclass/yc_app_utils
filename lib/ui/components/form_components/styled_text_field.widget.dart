import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class StyledTextFieldWidget extends StatefulWidget {
  const StyledTextFieldWidget({
    required this.textFieldData,
    this.onSaved,
    this.textValueNotifier,
    this.border,
    this.focusedBorder,
    this.autofocus,
    this.prefilledText,
    Key? key,
  }) : super(key: key);

  final StyledInputFieldModel textFieldData;
  final void Function(String, String?)? onSaved;
  final ValueNotifier<String>? textValueNotifier;
  final OutlineInputBorder? border;
  final OutlineInputBorder? focusedBorder;
  final bool? autofocus;
  final String? prefilledText;

  @override
  State<StyledTextFieldWidget> createState() => _StyledTextFieldWidgetState();
}

class _StyledTextFieldWidgetState extends State<StyledTextFieldWidget> {
  Country _selectedCountry = Country.allCountries.firstWhere(
    (element) => element.code == 'IN',
  );

  bool get isMobileField =>
      widget.textFieldData.inputFieldType == InputFieldEnum.MOBILE;

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: CommonHelpers.getPaddingFromList(
        widget.textFieldData.padding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.textFieldData.label != null) ...{
            Row(
              children: [
                Flexible(
                  child: V2StyledTextWidget(
                    styledText: widget.textFieldData.label!,
                  ),
                ),
                if (widget.textFieldData.validation?.isRequired?.value == true)
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
          Row(
            children: [
              if (isMobileField)
                CountryPicker(
                  showDialingCode: true,
                  showName: false,
                  onChanged: (Country country) {
                    setState(() {
                      _selectedCountry = country;
                    });
                  },
                  selectedCountry: _selectedCountry,
                  dialingCodeTextStyle: CommonHelpers.getTextStyle(
                    TStyle.B1_600,
                  ),
                ),
              Flexible(
                child: FormBuilderTextField(
                  name: widget.textFieldData.name,
                  cursorColor: AppColors.cTANGERINE_100,
                  onChanged: (value) {
                    if (widget.textValueNotifier != null && value != null) {
                      widget.textValueNotifier!.value = value;
                    }
                  },
                  initialValue: widget.prefilledText ??
                      widget.textFieldData.inputDefaultValue,
                  enabled: !widget.textFieldData.isDisabled,
                  textAlignVertical: TextAlignVertical.bottom,
                  inputFormatters: [
                    if (widget.textFieldData.inputFieldType ==
                            InputFieldEnum.NUMBER ||
                        isMobileField)
                      FilteringTextInputFormatter.digitsOnly
                  ],
                  maxLines: widget.textFieldData.maxLines,
                  minLines: widget.textFieldData.isExpanded ? null : 1,
                  keyboardType:
                      getKeyboardType(widget.textFieldData.inputFieldType),
                  obscureText: widget.textFieldData.inputFieldType ==
                      InputFieldEnum.PASSWORD,
                  decoration: widget.textFieldData.inputDecoration ??
                      InputDecoration(
                        border: widget.textFieldData.showUnderline
                            ? widget.border
                            : InputBorder.none,
                        focusedBorder: widget.textFieldData.showUnderline
                            ? widget.focusedBorder
                            : InputBorder.none,
                        hintText: widget.textFieldData.placeholder,
                        hintStyle: const TextStyle(
                          color: AppColors.cBODY_TEXT_75,
                          fontSize: 16,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.s,
                          vertical: AppSpacing.m,
                        ),
                        counter: widget.textFieldData.maxCounterVisible
                            ? null
                            : const SizedBox.shrink(),
                      ),
                  maxLength: widget.textFieldData.validation?.maxLength?.value,
                  style: widget.textFieldData.textStyle ??
                      const TextStyle(
                        color: AppColors.cBODY_TEXT,
                        fontSize: 16,
                      ),
                  validator: (value) => CommonHelpers.validateTextField(
                    value: value ?? '',
                    validations: widget.textFieldData.validation,
                  ),
                  onSaved: (value) {
                    String updatedVal = value ?? '';
                    if (isMobileField) {
                      updatedVal = _selectedCountry.value + updatedVal;
                    }
                    widget.onSaved?.call(
                      widget.textFieldData.name,
                      updatedVal,
                    );
                  },
                  autofocus: widget.autofocus ?? false,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
