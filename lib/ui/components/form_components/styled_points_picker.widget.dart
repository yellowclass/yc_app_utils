import 'package:flutter/material.dart';
import 'package:yc_app_utils/models/form_component/styled_points_picker.model.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class PointsPickerWidget extends StatefulWidget {
  final StyledPointsPickerModel? pointsPickerdata;
  final ValueChanged<int?> onItemSelected;
  const PointsPickerWidget({
    super.key,
    this.pointsPickerdata,
    required this.onItemSelected,
  });

  @override
  State<PointsPickerWidget> createState() => _PointsPickerWidgetState();
}

class _PointsPickerWidgetState extends State<PointsPickerWidget>
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
            padding: const EdgeInsets.only(left: 16.0),
            child: Align(
              alignment: widget.pointsPickerdata!.topLabelAlignment ??
                  Alignment.centerLeft,
              child: V2StyledTextWidget(
                  styledText: widget.pointsPickerdata!.topLabel!),
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
                      return getPickerOptions(
                          pickerOption, index, selectedIndex, _selectItem);
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

Widget getPickerOptions(CircularButton pickerOption, int index,
    int? selectedIndex, ValueChanged<int> onItemSelected) {
  return GestureDetector(
    onTap: () => onItemSelected(index),
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: selectedIndex == index
            ? AppColors.parseStringToColor(pickerOption.borderColor)
            : Colors.transparent,
        border: Border.all(
          color: selectedIndex == index
              ? Colors.white
              : AppColors.parseStringToColor(pickerOption.borderColor),
        ),
      ),
      child: V2StyledTextWidget(
        styledText: selectedIndex == index
            ? pickerOption.selectedComponent!
            : pickerOption.unselectedComponent!,
      ),
    ),
  );
}
