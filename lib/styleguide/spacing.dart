import 'package:flutter/material.dart';

class AppSpacing {
  AppSpacing._(); // Private constructor, this basically makes it so you cannot instantiate this class

  static const double xxs2 = 2.0;
  static const double xxs = 4.0;
  static const double xs = 8.0;
  static const double s = 12.0;
  static const double m = 16.0;
  static const double l = 24.0;
  static const double xl = 32.0;
  static const double xxl = 40.0;
  static const double xxl2 = 48.0;
  static const double xxl3 = 100.0;

  //Common vertical spacing
  static const Widget xxs2Height = SizedBox(height: xxs2);
  static const Widget xxsHeight = SizedBox(height: xxs);
  static const Widget xsHeight = SizedBox(height: xs);
  static const Widget sHeight = SizedBox(height: s);
  static const Widget mHeight = SizedBox(height: m);
  static const Widget lHeight = SizedBox(height: l);
  static const Widget xlHeight = SizedBox(height: xl);
  static const Widget xxlHeight = SizedBox(height: xxl);
  static const Widget xxl2Height = SizedBox(height: xxl2);
  static const Widget xxl3Height = SizedBox(height: xxl3);

  static const Widget xxs2Width = SizedBox(width: xxs2);
  static const Widget xxsWidth = SizedBox(width: xxs);
  static const Widget xsWidth = SizedBox(width: xs);
  static const Widget sWidth = SizedBox(width: s);
  static const Widget mWidth = SizedBox(width: m);
  static const Widget lWidth = SizedBox(width: l);
  static const Widget xlWidth = SizedBox(width: xl);
  static const Widget xxlWidth = SizedBox(width: xxl);
  static const Widget xxl2Width = SizedBox(width: xxl2);
  static const Widget xxl3Width = SizedBox(width: xxl3);
}
