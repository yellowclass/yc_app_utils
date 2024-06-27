import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:yc_app_utils/helpers/helpers.dart';
import 'package:yc_app_utils/models/v2_text_style.model.dart';
import 'package:yc_app_utils/ui/styleguide/colors.dart';
import 'package:yc_app_utils/ui/text_styles/tstyle.enum.dart';

class StyledDateTimeBlocks extends StatefulWidget {
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final bool isDisabled;
  final Function(String?) onChanged;
  final Function(DateTime) onSaved;
  final InputDecoration inputDecoration;
  final TextStyle style;
  final TextAlign? textAlign;

  const StyledDateTimeBlocks({
    required this.onChanged,
    required this.onSaved,
    required this.isDisabled,
    required this.inputDecoration,
    required this.style,
    this.textAlign,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    super.key,
  });

  @override
  State<StyledDateTimeBlocks> createState() => _StyledDateTimeBlocksState();
}

class _StyledDateTimeBlocksState extends State<StyledDateTimeBlocks> {
  FocusNode dayFocusNode = FocusNode();
  FocusNode monthFocusNode = FocusNode();
  FocusNode yearFocusNode = FocusNode();

  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  final ValueNotifier<String?> errorText = ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    _handleInitialDate();
  }

  String? validateDob(val) {
    //errorText is handled manually because there exist 3 textFormField and  form validation will start showing 3 different texts.
    errorText.value = null;
    try {
      // will throw error if the date is not valid
      final date = DateFormat('dd-MM-yyyy').parseStrict(
          '${dayController.value.text}-${monthController.value.text}-${yearController.value.text}');

      // check if date exist in valid range or not
      if ((widget.firstDate == null ||
              date.compareTo(widget.firstDate!) >= 0) &&
          (widget.lastDate == null || date.compareTo(widget.lastDate!) <= 0)) {
        return null;
      } else {
        throw Exception("not a valid date");
      }
    } catch (e) {
      errorText.value = "Enter a valid Date";
      return '';
    }
  }

  void _handleInitialDate() {
    if (widget.initialDate != null) {
      dayController.value =
          TextEditingValue(text: widget.initialDate!.day.toString());
      monthController.value =
          TextEditingValue(text: widget.initialDate!.month.toString());
      yearController.value =
          TextEditingValue(text: widget.initialDate!.year.toString());
    }
  }

  void _handleOnChange() {
    widget.onChanged.call(
        '${dayController.value.text}-${monthController.value.text}-${yearController.value.text}');
  }

  // common function to remove the build counter of text fields.
  Widget? _buildCounter(
    context, {
    required int currentLength,
    required bool isFocused,
    maxLength,
  }) =>
      const SizedBox.shrink();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: TextFormField(
                focusNode: dayFocusNode,
                controller: dayController,
                enabled: !widget.isDisabled,
                onChanged: (value) {
                  _handleOnChange();

                  //change focus to month is length is 2
                  if (value.length == 2) {
                    FocusScope.of(context).requestFocus(monthFocusNode);
                  }
                },
                onSaved: (val) {
                  final date = DateFormat('dd-MM-yyyy').parseStrict(
                      '${dayController.value.text}-${monthController.value.text}-${yearController.value.text}');
                  widget.onSaved.call(date);
                },
                validator: validateDob,
                decoration: widget.inputDecoration.copyWith(hintText: 'DD'),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                maxLength: 2,
                textAlign: widget.textAlign ?? TextAlign.center,
                style: widget.style,
                buildCounter: _buildCounter,
              ),
            ),
            const Spacer(flex: 1),
            Flexible(
              flex: 2,
              child: TextFormField(
                focusNode: monthFocusNode,
                enabled: !widget.isDisabled,
                controller: monthController,
                onChanged: (value) {
                  _handleOnChange();

                  //change focus to year field
                  if (value.length == 2) {
                    FocusScope.of(context).requestFocus(yearFocusNode);
                  }

                  //change focus to month field
                  if (value.isEmpty) {
                    FocusScope.of(context).requestFocus(dayFocusNode);
                  }
                },
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: widget.inputDecoration.copyWith(hintText: 'MM'),
                validator: validateDob,
                keyboardType: TextInputType.number,
                maxLength: 2,
                style: widget.style,
                textAlign: widget.textAlign ?? TextAlign.center,
                buildCounter: _buildCounter,
              ),
            ),
            const Spacer(flex: 1),
            Flexible(
              flex: 3,
              child: TextFormField(
                focusNode: yearFocusNode,
                controller: yearController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: widget.inputDecoration.copyWith(hintText: 'YYYY'),
                validator: validateDob,
                buildCounter: _buildCounter,
                enabled: !widget.isDisabled,
                style: widget.style,
                textAlign: widget.textAlign ?? TextAlign.center,
                onChanged: (value) {
                  _handleOnChange();
                  if (value.isEmpty) {
                    FocusScope.of(context).requestFocus(monthFocusNode);
                  }
                },
                keyboardType: TextInputType.number,
                maxLength: 4,
              ),
            ),
          ],
        ),
        ValueListenableBuilder<String?>(
          valueListenable: errorText,
          builder: (context, value, _) => value != null
              ? CommonHelpers.getV2StyledTextWidgetFromTextStyle(
                  text: value,
                  textStyle: V2TextStyle(
                      textColor: CommonHelpers.colorToHex(AppColors.cRed_100),
                      tStyle: TStyle.B1_400),
                )
              : const SizedBox.shrink(),
        )
      ],
    );
  }
}
