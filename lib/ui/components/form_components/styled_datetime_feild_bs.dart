import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yc_app_utils/models/form_component/datetime_bs_style.model.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class StyledDateTimeFieldBS extends StatefulWidget {
  const StyledDateTimeFieldBS({
    required this.inputFormat,
    required this.initialDate,
    required this.onChanged,
    required this.isDisabled,
    required this.onSaved,
    required this.inputDecoration,
    required this.style,
    this.firstDate,
    this.lastDate,
    this.bottomSheetStyle,
    this.innerClickAction,
    this.validator,
    super.key,
  });
  final CupertinoDatePickerMode inputFormat;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final Function(DateTime) onChanged;
  final Function(DateTime) onSaved;
  final DateTime? initialDate;
  final DateTimeBottomSheetStyle? bottomSheetStyle;
  final InnerClickAction? innerClickAction;
  final bool isDisabled;
  final InputDecoration inputDecoration;
  final TextStyle style;
  final String? Function(DateTime?)? validator;

  @override
  State<StyledDateTimeFieldBS> createState() => _StyledDateTimeFieldBSState();
}

class _StyledDateTimeFieldBSState extends State<StyledDateTimeFieldBS> {
  late final ValueNotifier<DateTime?> date;

  final TextEditingController _controller = TextEditingController();
  DateTime? _tempDate;

  @override
  void initState() {
    super.initState();

    // setting initial date in case which it is not coming to avoid assertion of DatePicker
    if (widget.initialDate == null && widget.lastDate != null) {
      // Set the time to start of the day to avoid the assertion
      DateTime startOfDay = DateTime(widget.lastDate!.year,
          widget.lastDate!.month, widget.lastDate!.day, 0, 0, 0, 0);
      date = ValueNotifier(startOfDay);
    } else {
      date = ValueNotifier(widget.initialDate);
      _controller.value = TextEditingValue(text: getDate(date.value!));
    }
    _tempDate = date.value;
    date.addListener(() {
      if (date.value != null) {
        _controller.value = TextEditingValue(text: getDate(date.value!));
      }
    });
  }

  String getDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: widget.inputDecoration,
      onSaved: (newValue) {
        widget.onSaved.call(date.value!);
      },
      style: widget.style,
      readOnly: true,
      validator: (val) {
        // check whether the text is dummy value or not
        if (_controller.value.text == '') {
          return widget.validator?.call(null);
        }
        return widget.validator?.call(date.value);
      },
      onTap: () => widget.isDisabled
          ? null
          : showCupertinoModalPopup<void>(
              context: context,
              builder: (BuildContext context) => Container(
                decoration: CommonHelpers.getBoxDecorationWithSectionBackground(
                  sectionBackground:
                      widget.bottomSheetStyle?.bottomSheetBackground,
                ),
                height: widget.bottomSheetStyle?.height ?? 300,
                child: Column(
                  children: [
                    if (widget.bottomSheetStyle?.labelText != null)
                      V2StyledTextWidget(
                        styledText: widget.bottomSheetStyle!.labelText,
                      ),
                    Expanded(
                      child: CupertinoDatePicker(
                        initialDateTime: date.value,
                        mode: widget.inputFormat,
                        minimumDate: widget.firstDate,
                        maximumDate: widget.lastDate,
                        use24hFormat: false,
                        onDateTimeChanged: (DateTime newDate) {
                          _tempDate = newDate;
                        },
                      ),
                    ),
                    if (widget.bottomSheetStyle?.bottomStickyBar != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.l),
                        child: GenericButtonV3Widget(
                          buttonDetails:
                              widget.bottomSheetStyle!.bottomStickyBar!,
                          onPressed: () {
                            if (widget.bottomSheetStyle?.bottomStickyBar?.key ==
                                    'save_date' &&
                                _tempDate != null) {
                              widget.onChanged.call(_tempDate!);
                              date.value = _tempDate;
                              date.notifyListeners();
                            }
                            if (widget.bottomSheetStyle?.bottomStickyBar
                                    ?.v2ClickAction !=
                                null) {
                              widget.innerClickAction?.call(
                                widget.bottomSheetStyle!.bottomStickyBar!
                                    .v2ClickAction!,
                                false,
                                null,
                                key: widget
                                    .bottomSheetStyle?.bottomStickyBar?.key,
                              );
                            }
                          },
                        ),
                      )
                  ],
                ),
              ),
            ),
    );
  }

  @override
  void dispose() {
    date.dispose();
    _controller.dispose();
    super.dispose();
  }
}
