import 'package:flutter/material.dart';
import 'package:yc_app_utils/models/form_component/styled_points_picker.model.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

Widget getPickerOptions({
  required InnerClickAction? handleInnerClickAction,
  required CircularButton pickerOption,
  required int index,
  required bool isSelected,
  required ValueChanged<int> onItemSelected,
}) {
  return GestureDetector(
    onTap: () {
      onItemSelected(index);
      handleInnerClickAction?.call(
        pickerOption.onOptionClick!,
        false,
        null,
        key:
            null, //  in this component we dont have any key just using this Clickaction for haptic feedback
      );
    },
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected
            ? AppColors.parseStringToColor(pickerOption.borderColor)
            : Colors.transparent,
        border: Border.all(
          color: isSelected
              ? Colors.white
              : AppColors.parseStringToColor(pickerOption.borderColor),
        ),
      ),
      child: V2StyledTextWidget(
        styledText: isSelected
            ? pickerOption.selectedComponent!
            : pickerOption.unselectedComponent!,
      ),
    ),
  );
}

class StyledPointsPickerWidget extends StatefulWidget {
  final StyledPointsPickerModel? pointsPickerdata;
  final ValueChanged<int?> onItemSelected;
  final InnerClickAction? innerClickAction;

  const StyledPointsPickerWidget({
    required this.onItemSelected,
    required this.innerClickAction,
    super.key,
    this.pointsPickerdata,
  });

  @override
  State<StyledPointsPickerWidget> createState() =>
      _StyledPointsPickerWidgetState();
}

class _StyledPointsPickerWidgetState extends State<StyledPointsPickerWidget>
    with SingleTickerProviderStateMixin {
  late ValueNotifier<int?> _selectedIndexNotifier;

  @override
  void initState() {
    super.initState();
    _selectedIndexNotifier = ValueNotifier<int?>(null);
  }

  @override
  void dispose() {
    _selectedIndexNotifier.dispose();
    super.dispose();
  }

  void _selectItem(int index) {
    _selectedIndexNotifier.value = index;
    widget.onItemSelected(index);
  }

  List<CircularButton> get options =>
      widget.pointsPickerdata?.pickerOptions ?? [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.pointsPickerdata?.topLabel != null)
          Padding(
            padding: const EdgeInsets.only(left: AppSpacing.m),
            child: Align(
              alignment: widget.pointsPickerdata!.topLabelAlignment ??
                  Alignment.centerLeft,
              child: V2StyledTextWidget(
                styledText: widget.pointsPickerdata!.topLabel!,
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(AppRadius.m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder<int?>(
                valueListenable: _selectedIndexNotifier,
                builder: (context, selectedIndex, child) {
                  return Wrap(
                    spacing: 12.0,
                    runSpacing: 16.0,
                    alignment: WrapAlignment.center,
                    children: List.generate(options.length, (index) {
                      final pickerOption = options[index];
                      bool isSelected = selectedIndex == index;
                      return getPickerOptions(
                          handleInnerClickAction: widget.innerClickAction,
                          pickerOption: pickerOption,
                          index: index,
                          isSelected: isSelected,
                          onItemSelected: _selectItem);
                    }),
                  );
                },
              ),
            ],
          ),
        ),
        if (widget.pointsPickerdata?.bottomLabel != null)
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.m),
            child: Align(
              alignment: widget.pointsPickerdata!.bottomLabelAlignment ??
                  Alignment.center,
              child: V2StyledTextWidget(
                  styledText: widget.pointsPickerdata!.bottomLabel!),
            ),
          ),
      ],
    );
  }
}
