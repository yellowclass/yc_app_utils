import 'package:flutter/material.dart';

import 'package:yc_app_utils/ui/styleguide/colors.dart';

class DashedLine extends StatelessWidget {
  const DashedLine({
    Key? key,
    this.thickness = 1,
    this.color = AppColors.cBLACK,
    this.dashWidth = 5.0,
    this.width = double.infinity,
  }) : super(key: key);
  final double thickness;
  final Color color;
  final double dashWidth;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final _boxWidth = constraints.constrainWidth();
          final _dashCount = (_boxWidth / (2 * dashWidth)).floor();
          return Flex(
            children: List.generate(
              _dashCount,
              (_) {
                return SizedBox(
                  width: dashWidth,
                  height: thickness,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: color),
                  ),
                );
              },
            ),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            direction: Axis.horizontal,
          );
        },
      ),
    );
  }
}
