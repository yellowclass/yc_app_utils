import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:yc_app_utils/models/section_background/section_background.model.dart';
import 'package:yc_app_utils/models/section_background/section_background_direction.enum.dart';
import 'package:yc_app_utils/models/section_background/section_bg_type.enum.dart';
import 'package:yc_app_utils/ui/media_query/yc_media_query.dart';
import 'package:yc_app_utils/ui/styleguide/colors.dart';
import 'package:yc_app_utils/ui/styleguide/spacing.dart';
import 'package:yc_app_utils/ui/text_styles/text_styles.dart';
import 'package:yc_app_utils/ui/text_styles/tstyle.enum.dart';

class CommonHelpers {
  CommonHelpers._();

  static void copyToClipboard(String copyTxt) {
    Clipboard.setData(ClipboardData(text: copyTxt));
  }

  static bool isNotEmptyList(List arr) {
    return arr.isNotEmpty;
  }

  static bool isNotEmptyMap(Map map) {
    return map.isNotEmpty;
  }

  static bool isNotEmptyString(String? str) {
    return str != null && str.isNotEmpty && str != '';
  }

  static bool isNotNullEntity(dynamic x) {
    return x != null;
  }

  static bool isNullEntity(dynamic x) {
    return x == null;
  }

  static bool get isNotIos => !Platform.isIOS;

  static bool get isIos => Platform.isIOS;

  static bool get isAndroid => Platform.isAndroid;

  static String getDurationString(Duration time) {
    String timeText = time.toString().split('.').first;
    if (timeText.split(':').first == "0") {
      timeText = timeText.split(':').sublist(1).join(':');
    }
    return timeText;
  }

  static String cleanMobileNumber(String num) {
    return num.replaceAll('-', '')
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll(' ', '')
        .trim();
  }

  static String compactNumFormatter(int? val) {
    return NumberFormat.compact().format(val ?? 0);
  }

  static Map<String, dynamic>? removeNullParams(
    Map<String, dynamic>? data, {
    List<String>? excludeParams,
  }) {
    if (excludeParams != null) {
      data!.removeWhere(
          (String k, dynamic v) => v == null && !excludeParams.contains(k));
    } else {
      data!.removeWhere((String k, dynamic v) => v == null);
    }
    return data;
  }

  // VALIDATORS
  static bool isNumber(String str) {
    return int.tryParse(str) != null;
  }

  static bool isValidEmail(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  static bool isValidName(String name) {
    return RegExp("^[A-Za-zs]{1,}[.]{0,1}[A-Za-zs]{0,}").hasMatch(name) &&
        name.length >= 2;
  }

  static Axis getAxisFromString(String? axis) {
    if (axis == "HORIZONTAL") {
      return Axis.horizontal;
    } else {
      return Axis.vertical;
    }
  }

  int random() {
    Random rn = Random();
    return rn.nextInt(6);
  }

  static T? enumFromString<T>(Iterable<T> values, String? value) {
    try {
      return values.firstWhere(
        (T type) => type.toString().split(".").last == value,
      );
    } catch (e) {
      return null;
    }
  }

  static Alignment getAlignmentFromString(String? alignment) {
    switch (alignment) {
      case 'TOP_LEFT':
        return Alignment.topLeft;
      case 'TOP_CENTER':
      case 'TOP_CENTRE':
        return Alignment.topCenter;
      case 'TOP_RIGHT':
        return Alignment.topRight;
      case 'BOTTOM_LEFT':
        return Alignment.bottomLeft;
      case 'BOTTOM_CENTER':
      case 'BOTTOM_CENTRE':
        return Alignment.bottomCenter;
      case 'BOTTOM_RIGHT':
        return Alignment.bottomRight;
      case 'CENTER_LEFT':
      case 'CENTRE_LEFT':
        return Alignment.centerLeft;
      case 'CENTER':
      case 'CENTRE':
        return Alignment.center;
      case 'CENTER_RIGHT':
      case 'CENTRE_RIGHT':
        return Alignment.centerRight;
      default:
        return Alignment.center;
    }
  }

  static MainAxisAlignment getFlexAlignmentFromString(String? alignment) {
    switch (alignment) {
      case 'CENTER':
        return MainAxisAlignment.center;
      case 'FLEX_START':
        return MainAxisAlignment.start;
      case 'FLEX_END':
        return MainAxisAlignment.end;
      case 'SPACE_AROUND':
        return MainAxisAlignment.spaceAround;
      case 'SPACE_BETWEEN':
        return MainAxisAlignment.spaceBetween;
      case 'SPACE_EVENLY':
        return MainAxisAlignment.spaceEvenly;
      default:
        return MainAxisAlignment.center;
    }
  }

  static TextAlign getTextAlignmentFromString(String? alignment) {
    switch (alignment) {
      case 'LEFT':
        return TextAlign.left;
      case 'CENTER':
        return TextAlign.center;
      case 'RIGHT':
        return TextAlign.right;
      default:
        return TextAlign.left;
    }
  }

  static EdgeInsetsGeometry getPaddingFromList(List<int> paddingItems) {
    switch (paddingItems.length) {
      case 0:
        return const EdgeInsets.all(0);
      case 1:
        return EdgeInsets.all(paddingItems.first.toDouble());
      case 2:
        return EdgeInsets.symmetric(
          vertical: paddingItems.first.toDouble(),
          horizontal: paddingItems.last.toDouble(),
        );
      case 3:
        return EdgeInsets.fromLTRB(
          paddingItems[1].toDouble(),
          paddingItems[0].toDouble(),
          paddingItems[1].toDouble(),
          paddingItems[2].toDouble(),
        );
      default:
        return EdgeInsets.fromLTRB(
          paddingItems[3].toDouble(),
          paddingItems[0].toDouble(),
          paddingItems[1].toDouble(),
          paddingItems[2].toDouble(),
        );
    }
  }

  static Color v2ColorFromHex(String? hexColor) {
    if (hexColor == null) {
      return AppColors.cTRANSPARENT;
    } else {
      String hexCode = hexColor.replaceAll('#', '');
      if (hexCode.length == 3) {
        // Refer https://www.w3.org/TR/css-color-3/
        hexCode = hexCode.characters.map((String e) => e + e).join();
      }
      return Color(int.parse('FF$hexCode', radix: 16));
    }
  }

  static TextStyle? getTextStyle(
    TStyle style, {
    TextStyle? customStyle,
  }) {
    Map<TStyle, TextStyle> textStyleMap = YCMediaQuery.getIsTablet()
        ? TextStyles.tabTextStyle
        : TextStyles.mobTextStyle;
    return customStyle != null
        ? textStyleMap[style]!.merge(customStyle)
        : textStyleMap[style];
  }

  static BoxDecoration getBoxDecorationWithSectionBackground({
    required SectionBackground sectionBackground,
    double borderRadius = AppSpacing.s,
  }) {
    switch (sectionBackground.backgroundType) {
      case SectionBgType.TRANSPARENT:
        return const BoxDecoration();
      case SectionBgType.FLAT_COLOR:
        return BoxDecoration(
          borderRadius: showSectionBorder(),
          color: CommonHelpers.v2ColorFromHex(
            sectionBackground.backgroundColor,
          ),
        );
      case SectionBgType.GRADIENT:
        return BoxDecoration(
          borderRadius: showSectionBorder(
              shouldLeaveBorder: sectionBackground.shouldLeaveBorder,
              borderRadius: borderRadius),
          gradient: LinearGradient(
            begin: getBeginDirection(sectionBackground.gradientDirection),
            end: getBottomDirection(sectionBackground.gradientDirection),
            colors: sectionBackground.gradientColors != null
                ? List<Color>.from(
                    sectionBackground.gradientColors!.map(
                      (color) => CommonHelpers.v2ColorFromHex(color),
                    ),
                  )
                : <Color>[
                    CommonHelpers.v2ColorFromHex(
                      sectionBackground.gradientColor1,
                    ),
                    CommonHelpers.v2ColorFromHex(
                      sectionBackground.gradientColor2,
                    )
                  ],
          ),
        );
      case SectionBgType.IMAGE:
        return BoxDecoration(
          image: sectionBackground.backgroundImgUrl != null
              ? DecorationImage(
                  // Only supports Non-vector image formats
                  image: CachedNetworkImageProvider(
                    sectionBackground.backgroundImgUrl!,
                  ),
                  fit: BoxFit.cover,
                )
              : null,
        );

      case SectionBgType.RADIAL_GRADIENT:
        return BoxDecoration(
          borderRadius: showSectionBorder(
              shouldLeaveBorder: sectionBackground.shouldLeaveBorder,
              borderRadius: borderRadius),
          gradient: RadialGradient(
            center:
                sectionBackground.radialGradient?.center ?? Alignment.center,
            radius: sectionBackground.radialGradient?.radius ?? 0.5,
            colors: List<Color>.from(
              sectionBackground.gradientColors!.map(
                (color) => CommonHelpers.v2ColorFromHex(color),
              ),
            ),
          ),
        );
      default:
        return const BoxDecoration();
    }
  }

  static BorderRadius? showSectionBorder(
      {bool shouldLeaveBorder = false, double borderRadius = AppSpacing.s}) {
    if (shouldLeaveBorder) {
      return BorderRadius.circular(borderRadius);
    } else {
      return null;
    }
  }

  static Alignment getBeginDirection(
      SectionGradientDirections? gradientDirection) {
    if (gradientDirection != null) {
      switch (gradientDirection) {
        case SectionGradientDirections.TOP_TO_BOTTOM:
          return Alignment.topCenter;
        case SectionGradientDirections.BOTTOM_TO_TOP:
          return Alignment.bottomCenter;
        case SectionGradientDirections.LEFT_TO_RIGHT:
          return Alignment.centerLeft;
        case SectionGradientDirections.RIGHT_TO_LEFT:
          return Alignment.centerRight;
        case SectionGradientDirections.TOP_LEFT_TO_BOTTOM_RIGHT:
          return Alignment.topLeft;
        case SectionGradientDirections.BOTTOM_LEFT_TO_TOP_RIGHT:
          return Alignment.bottomLeft;
        default:
          return Alignment.topCenter;
      }
    } else {
      return Alignment.topCenter;
    }
  }

  static Alignment getBottomDirection(
      SectionGradientDirections? gradientDirection) {
    if (gradientDirection != null) {
      switch (gradientDirection) {
        case SectionGradientDirections.TOP_TO_BOTTOM:
          return Alignment.bottomCenter;
        case SectionGradientDirections.BOTTOM_TO_TOP:
          return Alignment.topCenter;
        case SectionGradientDirections.LEFT_TO_RIGHT:
          return Alignment.centerRight;
        case SectionGradientDirections.RIGHT_TO_LEFT:
          return Alignment.centerLeft;
        case SectionGradientDirections.TOP_LEFT_TO_BOTTOM_RIGHT:
          return Alignment.bottomRight;
        case SectionGradientDirections.BOTTOM_LEFT_TO_TOP_RIGHT:
          return Alignment.topRight;
        default:
          return Alignment.bottomCenter;
      }
    } else {
      return Alignment.topCenter;
    }
  }
}
