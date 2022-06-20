import 'package:flutter/material.dart';

import 'package:yc_app_utils/ui/text_styles/tstyle.enum.dart';

class YCMediaQuery {
  YCMediaQuery._();

  static late MediaQueryData _mediaQueryData;
  static double? screenWidth;
  static late double screenHeight;
  static late double viewTopPadding;
  static late double viewBottomPadding;
  static late double viewTopInsets;
  static late double viewBottomInsets;
  static double? blockSizeHorizontal;
  static double? blockSizeVertical;
  static bool? isTablet;
  static late Map<TStyle, TextStyle> textStyleMap;
  static late double statusBarHeight;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    viewTopPadding = _mediaQueryData.viewPadding.top;
    viewBottomPadding = _mediaQueryData.viewPadding.bottom;
    viewTopInsets = _mediaQueryData.viewInsets.top;
    viewBottomInsets = _mediaQueryData.viewInsets.bottom;

    // NOTE: Typical breakpoint for 7-inch tablet
    isTablet = _mediaQueryData.size.shortestSide >= 600;
    statusBarHeight = _mediaQueryData.padding.top;
  }

  static bool getIsTablet() {
    return isTablet ?? false;
  }

  static double getScreenWidth(
      {BuildContext? context, double? divideBy, double? multiplyBy}) {
    return screenWidth! * (multiplyBy ?? 1) / (divideBy ?? 1);
  }

  static double getScreenHeight(
      {BuildContext? context, double? divideBy, double? multiplyBy}) {
    return screenHeight * (multiplyBy ?? 1) / (divideBy ?? 1);
  }

  static double convertToPixel(
    double screenPercent, {
    bool forHeight = false,
    double aspectRatio = 0,
  }) {
    /// A B Y
    /// 0 0 1
    /// 0 1 1
    /// 1 0 0
    /// 1 1 1
    /// A: forHeight
    /// B: aspectRatio > 0
    /// Y = ~A + B
    assert(
      !forHeight || aspectRatio > 0,
      "AspectRatio not provided or cannot be negative",
    );
    if (forHeight && aspectRatio <= 0) {
      aspectRatio = 3 / 2;
    }
    double _widthPx = (screenPercent / 100) * (screenWidth ?? 390);
    return forHeight ? (_widthPx / aspectRatio) : _widthPx;
  }
}
