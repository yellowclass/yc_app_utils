import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'dart:math';

import 'package:yc_app_utils/models/styled_component/styled_shimmer.model.dart';

class ShimmerButtonWidget extends StatelessWidget {
  final Color color;
  final Color plunkColor;
  final double tiltAngle;
  final double depth;
  final double shimmerWidth;
  final double smallShimmerWidth;
  final Animation<double> controller;
  final StyledShimmerModel styledShimmerModel;
  final Widget child;

  const ShimmerButtonWidget({
    Key? key,
    required this.color,
    required this.plunkColor,
    required this.tiltAngle,
    required this.depth,
    required this.shimmerWidth,
    required this.controller,
    required this.child,
    required this.smallShimmerWidth,
    required this.styledShimmerModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: CommonHelpers.getBorderRadiusFromList(
        styledShimmerModel.borderRadius,
      ),
      child: CustomPaint(
        painter: ButtonShimmerPainter(
          smallShimmerWidth: smallShimmerWidth,
          color: color,
          plunkColor: plunkColor,
          tiltAngle: tiltAngle,
          depth: depth,
          shimmerWidth: shimmerWidth,
          ticker: controller,
          plunkAngle: pi / 3,
        ),
        child: Container(
          padding: CommonHelpers.getPaddingFromList(
            styledShimmerModel.padding,
          ),
          child: child,
        ),
      ),
    );
  }
}

class ButtonShimmerPainter extends CustomPainter {
  const ButtonShimmerPainter({
    required this.tiltAngle,
    required this.plunkAngle,
    required this.depth,
    required this.shimmerWidth,
    required this.color,
    required this.ticker,
    required this.plunkColor,
    required this.smallShimmerWidth,
  }) : super(repaint: ticker);

  /// Angle at which the shimmer is tilted.
  final double tiltAngle;

  final double smallShimmerWidth;

  /// Angle at which the plunk of the shimmer is tilted.
  final double plunkAngle;

  /// Width of the shimmer.
  final double shimmerWidth;

  /// Depth of the button
  final double depth;

  /// Color of the shimmer
  final Color color;

  /// Color of the shimmer over plunk
  final Color plunkColor;

  /// Ticker to animate the shimmer position and angle
  final Animation<double> ticker;

  @override
  void paint(Canvas canvas, Size size) {
    final smallShimmer = smallShimmerWidth;
    const padding = 10.0;
    final width = size.width + padding + (2 * shimmerWidth) + 15;
    final y = size.height;

    // Animate the x position from left to right
    double x = width * ticker.value; // Move from 0 to width

    // Keep tilt and plunk angles constant
    final tanTheta = tan(tiltAngle);
    final tanAlpha = tan(plunkAngle);

    final p = y / tanTheta;
    final q = depth / tanAlpha;

    final Path path = Path();
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Paint large shimmer
    canvas.drawPath(
      path
        ..addPolygon(
          [
            Offset(x, y),
            Offset(x + p, 0),
            Offset(x + p - shimmerWidth, 0),
            Offset(x - shimmerWidth, y),
          ],
          true,
        ),
      paint,
    );

    path.reset();
    paint.color = color;
    canvas.drawPath(
      path
        ..addPolygon(
          [
            Offset(x, y),
            Offset(x - shimmerWidth, y),
            Offset(x - shimmerWidth + q, y + depth),
            Offset(x + q, y + depth),
          ],
          true,
        ),
      paint,
    );

    // Paint small shimmer
    x = x - shimmerWidth - padding;
    path.reset();
    paint.color = color;

    canvas.drawPath(
      path
        ..addPolygon(
          [
            Offset(x, y),
            Offset(x - smallShimmer, y),
            Offset(x - smallShimmer + p, 0),
            Offset(x + p, 0),
          ],
          true,
        ),
      paint,
    );

    path.reset();
    paint.color = color;
    canvas.drawPath(
      path
        ..addPolygon(
          [
            Offset(x, y),
            Offset(x - smallShimmer, y),
            Offset(x - smallShimmer + q, y + depth),
            Offset(x + q, y + depth),
          ],
          true,
        ),
      paint,
    );

    path.reset();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
