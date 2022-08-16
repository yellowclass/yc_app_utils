import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class StyledDateTimeFieldWidget extends StatefulWidget {
  const StyledDateTimeFieldWidget({
    required this.dateTimeFieldData,
    this.onSaved,
    Key? key,
  }) : super(key: key);

  final StyledDateTimeFieldModel dateTimeFieldData;
  final void Function(String, String?)? onSaved;

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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.dateTimeFieldData.label != null)
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: V2StyledTextWidget(
                  styledText: widget.dateTimeFieldData.label!,
                ),
              ),
              if (widget.dateTimeFieldData.validation?.isRequired?.value ==
                  true)
                const Text(
                  '*',
                  style: TextStyle(
                    color: AppColors.cRed_100,
                  ),
                ),
            ],
          ),
        FormBuilderDateTimePicker(
          name: widget.dateTimeFieldData.name,
          initialDate:
              getParsedDate(widget.dateTimeFieldData.defaultDateTimeValue),
          firstDate: getParsedDate(widget.dateTimeFieldData.firstDate),
          lastDate: getParsedDate(widget.dateTimeFieldData.lastDate),
          inputType: dateTimeInputType,
          enabled: !widget.dateTimeFieldData.isDisabled,
          style: const TextStyle(
            color: AppColors.cBODY_TEXT,
            fontSize: 16,
          ),
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          format: dateFormat,
          decoration: InputDecoration(
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
          onSaved: (value) {
            widget.onSaved?.call(
              widget.dateTimeFieldData.name,
              value?.toIso8601String(),
            );
          },
        ),
      ],
    );
  }
}
