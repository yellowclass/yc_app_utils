import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:yc_app_utils/models/form_component/styled_rating_slider.model.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class StyledRatingSliderWidget extends StatefulWidget {
  const StyledRatingSliderWidget({
    required this.data,
    required this.onSaved,
    super.key,
  });

  final StyledRatingSlider data;
  final void Function(String, Map<String, dynamic>?)? onSaved;

  @override
  State<StyledRatingSliderWidget> createState() =>
      _StyledRatingSliderWidgetState();
}

class _StyledRatingSliderWidgetState extends State<StyledRatingSliderWidget> {
  double value = 0;

  @override
  void initState() {
    value = widget.data.defaultValue?.toDouble() ?? 0;
    super.initState();
  }

  Widget get gradientContainer => Container(
        width: double.infinity,
        height: AppSpacing.m,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: widget.data.gradientColors
                .map((e) => CommonHelpers.v2ColorFromHex(e))
                .toList(),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.cBLACK_10),
            borderRadius: BorderRadius.circular(AppRadius.m),
          ),
          padding: EdgeInsets.only(
            left: AppSpacing.m,
            right: AppSpacing.m,
            bottom: AppSpacing.xs,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.s),
                child: _SliderNumberPallet(
                  levels: widget.data.levels,
                  selectedValue: value.toInt(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    gradientContainer,
                    SliderTheme(
                      data: SliderThemeData(
                        trackHeight: AppSpacing.m,
                        thumbColor: AppColors.cORANGE_25,
                        inactiveTrackColor: AppColors.cBLACK_10,
                        trackShape: CustomSliderTrackShape(),
                        inactiveTickMarkColor:
                            CommonHelpers.v2ColorFromHex("#d8d8d8"),
                        activeTickMarkColor: AppColors.cTRANSPARENT,
                        tickMarkShape: RoundSliderTickMarkShape(
                          tickMarkRadius: 2,
                        ),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                        activeTrackColor: Colors.transparent,
                      ),
                      child: Slider(
                        value: value,
                        min: 0,
                        max: (widget.data.levels.length - 1).toDouble(),
                        divisions: widget.data.levels.length - 1,
                        autofocus: false,
                        onChangeEnd: (value) {
                          widget.onSaved?.call(widget.data.id, {
                            "id": widget.data.levels[value.toInt()].id,
                          });
                        },
                        onChanged: (value) {
                          Vibration.vibrate(pattern: [20, 30]);
                          setState(() {
                            this.value = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppSpacing.s),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.data.prefix != null)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    widget.data.prefix!.length,
                    (index) => V2StyledTextWidget(
                      styledText: widget.data.prefix![index],
                    ),
                  ),
                ),
              if (widget.data.suffix != null)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    widget.data.suffix!.length,
                    (index) => V2StyledTextWidget(
                      styledText: widget.data.suffix![index],
                    ),
                  ),
                ),
            ],
          ),
        )
      ],
    );
  }
}

class _SliderNumberPallet extends StatelessWidget {
  const _SliderNumberPallet({
    required this.levels,
    required this.selectedValue,
    super.key,
  });

  final List<RatingSliderLevel> levels;
  final int selectedValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        levels.length,
        (index) => Container(
          width: 24,
          decoration: BoxDecoration(
            color: index == selectedValue
                ? CommonHelpers.v2ColorFromHex(levels[index].onSelectBgColor)
                : AppColors.cWHITE_100,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: V2StyledTextWidget(
              styledText: index == selectedValue
                  ? levels[index].label.copyWith(
                        textColor: "#ffffff",
                      )
                  : levels[index].label,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSliderTrackShape extends RoundedRectSliderTrackShape {
  const CustomSliderTrackShape();

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final trackHeight = sliderTheme.trackHeight;
    final trackLeft = offset.dx;
    final trackTop = offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
