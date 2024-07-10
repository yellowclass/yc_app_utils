import 'package:flutter/material.dart';
import 'package:yc_app_utils/models/form_component/styled_points_picker.model.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class PointsPickerWidget extends StatefulWidget {
  final StyledPointsPickerModel? pointsPickerdata;
  final ValueChanged<int?> onItemSelected;
  const PointsPickerWidget(
      {super.key, this.pointsPickerdata, required this.onItemSelected});

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

  @override
  Widget build(BuildContext context) {
    final options = widget.pointsPickerdata?.pickerOptions ?? [];
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
          padding: const EdgeInsets.all(12.0),
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
                      final entry = options[index];
                      return GestureDetector(
                        onTap: () => _selectItem(index),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: selectedIndex == index
                                ? AppColors.parseStringToColor(
                                    entry.borderColor)
                                : Colors.transparent,
                            border: Border.all(
                              color: selectedIndex == index
                                  ? Colors.white
                                  : AppColors.parseStringToColor(
                                      entry.borderColor),
                            ),
                          ),
                          child: V2StyledTextWidget(
                            styledText: selectedIndex == index
                                ? entry.selectedComponent!
                                : entry.unSelectedComponent!,
                          ),
                        ),
                      );
                    }),
                  );
                },
              ),
            ],
          ),
        ),
        if (widget.pointsPickerdata?.bottomLabel != null)
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
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
