// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yc_app_utils/helpers/helpers.dart';

import 'package:yc_app_utils/models/styled_component/styled_timer.model.dart';
import 'package:yc_app_utils/ui/components/styled_components/v2_styled_text.widget.dart';

enum DurationEnum {
  DAY,
  HOUR,
  MINUTE,
  SECOND,
}

class TimerItemData {
  DurationEnum durationEnum;
  int value;
  String valueText = '';
  TimerItemData({
    required this.durationEnum,
    required this.value,
  }) {
    this.valueText = value > 9 ? '$value' : '0$value';
  }
}

class StyledTimerWidget extends StatefulWidget {
  final StyledTimerModel styledTimerData;
  const StyledTimerWidget({
    required this.styledTimerData,
    super.key,
  });

  @override
  State<StyledTimerWidget> createState() => _StyledTimerWidgetState();
}

class _StyledTimerWidgetState extends State<StyledTimerWidget> {
  List<TimerItemData> timerItems = <TimerItemData>[];
  Timer? timer;

  _setTimerItems() {
    timerItems.clear();
    int days = widget.styledTimerData.duration.inDays;
    if (days > 0) {
      timerItems.add(
        TimerItemData(
          durationEnum: DurationEnum.DAY,
          value: days,
        ),
      );
    }

    int hours = widget.styledTimerData.duration.inHours;
    timerItems.add(
      TimerItemData(
        durationEnum: DurationEnum.HOUR,
        value: hours % 24,
      ),
    );

    int minutes = widget.styledTimerData.duration.inMinutes;
    timerItems.add(
      TimerItemData(
        durationEnum: DurationEnum.MINUTE,
        value: minutes % 60,
      ),
    );

    int seconds = widget.styledTimerData.duration.inSeconds;

    if (days == 0) {
      timerItems.add(
        TimerItemData(
          durationEnum: DurationEnum.SECOND,
          value: seconds % 60,
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _setTimerItems();
    timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (widget.styledTimerData.duration.inSeconds > 0) {
          setState(() {
            widget.styledTimerData.duration =
                widget.styledTimerData.duration - const Duration(seconds: 1);
            _setTimerItems();
          });
        } else {
          timer.cancel();
        }
      },
    );
  }

  V2StyledTextWidget buildLabel({
    required int value,
    required DurationEnum durationEnum,
  }) {
    return CommonHelpers.getV2StyledTextWidgetFromTextStyle(
      text: Intl.plural(
        value,
        zero: '${durationEnum.name}S',
        one: durationEnum.name,
        other: '${durationEnum.name}S',
      ),
      textStyle: widget.styledTimerData.labelStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    bool? isTopLabel = widget.styledTimerData.labelPosition == null
        ? null
        : widget.styledTimerData.labelPosition == StickyPositionEnum.TOP;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        timerItems.length + 2,
        (index) {
          if (index.isOdd) {
            return CommonHelpers.getV2StyledTextWidgetFromTextStyle(
              text: ' : ',
              textStyle: widget.styledTimerData.separatorTextStyle,
            );
          }
          TimerItemData timerItemData = timerItems[index ~/ 2];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isTopLabel ?? false)
                buildLabel(
                  value: timerItemData.value,
                  durationEnum: timerItemData.durationEnum,
                ),
              CommonHelpers.getV2StyledTextWidgetFromTextStyle(
                text: timerItemData.valueText,
                textStyle: widget.styledTimerData.boxTextStyle,
              ),
              if (!(isTopLabel ?? true))
                buildLabel(
                  value: timerItemData.value,
                  durationEnum: timerItemData.durationEnum,
                ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
