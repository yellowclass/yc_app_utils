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
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = null;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _selectItem(int index) {
    setState(() {
      _selectedIndex = index;
      widget.onItemSelected(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final pointsPickerText = widget.pointsPickerdata != null
        ? widget.pointsPickerdata
            .toString() 
        : 'No data available';
    print(pointsPickerText.toString());

    final options = widget.pointsPickerdata?.pickerOptions ?? [];

    return Column(
      children: [
        if (widget.pointsPickerdata?.topLabel != null)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: V2StyledTextWidget(
                  styledText: widget.pointsPickerdata!.topLabel!),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 12.0,
                runSpacing: 16.0,
                alignment: WrapAlignment.center,
                children: [
                  ...options.asMap().entries.map(
                        (entry) => GestureDetector(
                          onTap: () => _selectItem(entry.key),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _selectedIndex == entry.key
                                  ? AppColors.parseStringToColor(
                                      entry.value.borderColor)
                                  : Colors.transparent,
                              border: Border.all(
                                color: _selectedIndex == entry.key
                                    ? Colors.white
                                    : AppColors.parseStringToColor(
                                        entry.value.borderColor),
                              ),
                            ),
                            child: V2StyledTextWidget(
                              styledText: _selectedIndex == entry.key
                                  ? entry.value.selectComponent!
                                  : entry.value.unselectComponent!,
                            ),
                          ),
                        ),
                      ),
                ],
              ),
            ],
          ),
        ),
        if (widget.pointsPickerdata?.bottomLabel != null)
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: V2StyledTextWidget(
                  styledText: widget.pointsPickerdata!.bottomLabel!),
            ),
          ),
      ],
    );
  }
}
