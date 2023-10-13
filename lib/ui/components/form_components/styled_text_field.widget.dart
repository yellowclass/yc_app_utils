import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class StyledTextFieldWidget extends StatefulWidget {
  const StyledTextFieldWidget({
    required this.textFieldData,
    this.showBorder = false,
    this.onSaved,
    this.textValueNotifier,
    this.borderRadius,
    Key? key,
  }) : super(key: key);

  final StyledInputFieldModel textFieldData;
  final bool showBorder;
  final void Function(String, String?)? onSaved;
  final ValueNotifier? textValueNotifier;
  final double? borderRadius;

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

  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.textFieldData.label != null)
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: V2StyledTextWidget(
                  styledText: widget.textFieldData.label!,
                ),
              ),
              if (widget.textFieldData.validation?.isRequired?.value == true)
                const Text(
                  '*',
                  style: TextStyle(
                    color: AppColors.cRed_100,
                  ),
                ),
            ],
          ),
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
              child: TextFormField(
                cursorColor: AppColors.cTANGERINE_100,
                controller: _textController,
                onChanged: (value) {
                  widget.textValueNotifier != null
                      ? widget.textValueNotifier!.value = value
                      : null;
                },
                initialValue: widget.textFieldData.inputDefaultValue,
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
                decoration: InputDecoration(
                  hintText: widget.textFieldData.placeholder,
                  border: OutlineInputBorder(
                    borderRadius: widget.borderRadius != null
                        ? BorderRadius.all(
                            Radius.circular(widget.borderRadius!))
                        : BorderRadius.zero,
                    borderSide: widget.showBorder
                        ? const BorderSide(
                            color: AppColors.cTANGERINE_100,
                            width: 10,
                          )
                        : BorderSide.none,
                  ),
                  focusedBorder: widget.showBorder
                      ? const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.cTANGERINE_100,
                          ),
                        )
                      : null,
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
                style: const TextStyle(
                  color: AppColors.cBODY_TEXT,
                  fontSize: 16,
                ),
                validator: (value) => CommonHelpers.validateTextField(
                  value: value!,
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
              ),
            ),
          ],
        ),
      ],
    );
  }
}
