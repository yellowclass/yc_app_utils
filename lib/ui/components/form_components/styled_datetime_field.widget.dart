import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:yc_app_utils/ui/components/form_components/styled_datetime_blocks.dart';
import 'package:yc_app_utils/ui/components/form_components/styled_datetime_feild_bs.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class StyledDateTimeFieldWidget extends StatefulWidget {
  const StyledDateTimeFieldWidget({
    required this.dateTimeFieldData,
    this.onSaved,
    this.onChanged,
    this.innerClickAction,
    Key? key,
  }) : super(key: key);

  final StyledDateTimeFieldModel dateTimeFieldData;
  final void Function(String, String?)? onSaved;
  final void Function(String?)? onChanged;

  final InnerClickAction? innerClickAction;

  @override
  State<StyledDateTimeFieldWidget> createState() =>
      _StyledDateTimeFieldWidgetState();
}

class _StyledDateTimeFieldWidgetState extends State<StyledDateTimeFieldWidget> {
  DateTime? getParsedDate(String? datetime) {
    if (datetime != null) {
      try {
        return DateTime.parse(datetime);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  InputType get dateTimeInputType {
    switch (widget.dateTimeFieldData.dateTimeFieldType) {
      case DateTimeFieldTypeEnum.DATE:
        return InputType.date;
      case DateTimeFieldTypeEnum.TIME:
        return InputType.time;
      case DateTimeFieldTypeEnum.DATETIME:
        return InputType.both;
      default:
        return InputType.date;
    }
  }

  DateFormat get dateFormat {
    switch (widget.dateTimeFieldData.dateTimeFieldType) {
      case DateTimeFieldTypeEnum.DATE:
        return DateFormat('d MMMM y');
      case DateTimeFieldTypeEnum.TIME:
        return DateFormat('jm');
      case DateTimeFieldTypeEnum.DATETIME:
        return DateFormat('jm').addPattern('d MMMM y', ', ');
      default:
        return DateFormat('d MMMM y');
    }
  }

  CupertinoDatePickerMode get dateFormatBS {
    switch (widget.dateTimeFieldData.dateTimeFieldType) {
      case DateTimeFieldTypeEnum.DATE:
        return CupertinoDatePickerMode.date;
      case DateTimeFieldTypeEnum.TIME:
        return CupertinoDatePickerMode.time;
      case DateTimeFieldTypeEnum.DATETIME:
        return CupertinoDatePickerMode.dateAndTime;
      default:
        return CupertinoDatePickerMode.date;
    }
  }

  Widget getDateTimeSection() {
    switch (widget.dateTimeFieldData.designStyle) {
      case DateTimeDesignStyle.BOTTOM_SHEET:
        return StyledDateTimeFieldBS(
          inputDecoration: widget.dateTimeFieldData.inputDecoration ??
              InputDecoration(
                hintStyle: const TextStyle(
                  color: AppColors.cBODY_TEXT_75,
                  fontSize: 16,
                ),
                hintText: widget.dateTimeFieldData.placeholder,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.s,
                  vertical: AppSpacing.m,
                ),
              ),
          validator: (value) => CommonHelpers.validateDateTimeField(
            value: value,
            validations: widget.dateTimeFieldData.validation,
          ),
          innerClickAction: widget.innerClickAction,
          bottomSheetStyle: widget.dateTimeFieldData.bottomSheetStyle,
          initialDate: widget.dateTimeFieldData.defaultDateTimeValue != null
              ? getParsedDate(widget.dateTimeFieldData.defaultDateTimeValue)
              : null,
          firstDate: getParsedDate(widget.dateTimeFieldData.firstDate),
          lastDate: getParsedDate(widget.dateTimeFieldData.lastDate),
          inputFormat: dateFormatBS,
          isDisabled: widget.dateTimeFieldData.isDisabled,
          onChanged: (value) {
            widget.onChanged?.call(value.toString());
          },
          onSaved: (value) {
            widget.onSaved?.call(
              widget.dateTimeFieldData.name,
              value.toIso8601String(),
            );
          },
          style: widget.dateTimeFieldData.textStyle ??
              const TextStyle(
                color: AppColors.cBODY_TEXT,
                fontSize: 16,
                fontFamily: YCFonts.nunitoRegular,
              ),
        );
      case DateTimeDesignStyle.BLOCKS:
        return StyledDateTimeBlocks(
            initialDate: widget.dateTimeFieldData.defaultDateTimeValue != null
                ? getParsedDate(widget.dateTimeFieldData.defaultDateTimeValue)
                : null,
            firstDate: getParsedDate(widget.dateTimeFieldData.firstDate),
            lastDate: getParsedDate(widget.dateTimeFieldData.lastDate),
            isDisabled: widget.dateTimeFieldData.isDisabled,
            inputDecoration: widget.dateTimeFieldData.inputDecoration ??
                InputDecoration(
                  hintStyle: const TextStyle(
                    color: AppColors.cBODY_TEXT_75,
                    fontSize: 16,
                  ),
                  hintText: widget.dateTimeFieldData.placeholder,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.s,
                    vertical: AppSpacing.m,
                  ),
                ),
            onChanged: (value) {
              widget.onChanged?.call(value.toString());
            },
            onSaved: (value) {
              widget.onSaved?.call(
                widget.dateTimeFieldData.name,
                value.toIso8601String(),
              );
            });

      case DateTimeDesignStyle.STANDARD:
      default:
        return FormBuilderDateTimePicker(
          textAlign: widget.dateTimeFieldData.textAlign ?? TextAlign.start,
          name: widget.dateTimeFieldData.name,
          initialDate: widget.dateTimeFieldData.defaultDateTimeValue != null
              ? getParsedDate(widget.dateTimeFieldData.defaultDateTimeValue)
              : getParsedDate(widget.dateTimeFieldData.lastDate),
          firstDate: getParsedDate(widget.dateTimeFieldData.firstDate),
          lastDate: getParsedDate(widget.dateTimeFieldData.lastDate),
          inputType: dateTimeInputType,
          enabled: !widget.dateTimeFieldData.isDisabled,
          style: widget.dateTimeFieldData.textStyle ??
              const TextStyle(
                color: AppColors.cBODY_TEXT,
                fontSize: 16,
              ),
          initialValue:
              getParsedDate(widget.dateTimeFieldData.defaultDateTimeValue),
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          format: dateFormat,
          decoration: widget.dateTimeFieldData.inputDecoration ??
              InputDecoration(
                hintStyle: const TextStyle(
                  color: AppColors.cBODY_TEXT_75,
                  fontSize: 16,
                ),
                hintText: widget.dateTimeFieldData.placeholder,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.s,
                  vertical: AppSpacing.m,
                ),
              ),
          validator: (value) => CommonHelpers.validateDateTimeField(
            value: value,
            validations: widget.dateTimeFieldData.validation,
          ),
          onChanged: (value) {
            widget.onChanged?.call(value?.toString());
          },
          onSaved: (value) {
            widget.onSaved?.call(
              widget.dateTimeFieldData.name,
              value?.toIso8601String(),
            );
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.dateTimeFieldData.label != null) ...{
          Row(
            children: [
              Flexible(
                child: V2StyledTextWidget(
                  styledText: widget.dateTimeFieldData.label!,
                ),
              ),
              if (widget.dateTimeFieldData.validation?.isRequired?.value ==
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
        getDateTimeSection(),
      ],
    );
  }
}
