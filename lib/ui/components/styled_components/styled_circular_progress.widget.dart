import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yc_app_utils/models/styled_component/styled_circular_progress.model.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class StyledCircularProgressWidget extends StatelessWidget {
  const StyledCircularProgressWidget({
    required this.styledCircularProgressData,
    super.key,
  });

  final StyledCircularProgress styledCircularProgressData;

  @override
  Widget build(BuildContext context) {
    final size = ((styledCircularProgressData.radius ?? 50) * 2).toDouble();
    return Center(
      child: CustomPaint(
        painter: CircularProgressPainter(
          styledCircularProgressData: styledCircularProgressData,
        ),
        size: Size(size, size),
        child: SizedBox(
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                width: size,
                height: size,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      styledCircularProgressData.innerTexts?.length ?? 0,
                          (index) {
                        return V2StyledTextWidget(
                          styledText: styledCircularProgressData
                              .innerTexts![index],
                        );
                      }),
                ),
              ),
              if (styledCircularProgressData.bottomIcon?.url != null)
                GenericNetworkImage(styledCircularProgressData.bottomIcon!.url)
            ],
          ),
        ),
      ),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  CircularProgressPainter({required this.styledCircularProgressData});

  final StyledCircularProgress styledCircularProgressData;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = (styledCircularProgressData.radius ?? 50).toDouble();
    final strokeWidth = (styledCircularProgressData.width ?? 5).toDouble();
    final percentage = (styledCircularProgressData.percentage ?? 0);

    var inactivePaint = Paint()
      ..color = styledCircularProgressData.inactiveColor ?? Colors.black38
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(
        Offset(radius, radius - 4), radius - strokeWidth, inactivePaint);

    var activePaint = Paint()
      ..color = styledCircularProgressData.activeColor ?? Colors.amber
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(radius, radius - 4), radius: radius - strokeWidth),
        (3 * pi) / 2,
        (pi / 50) * percentage,
        false,
        activePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
