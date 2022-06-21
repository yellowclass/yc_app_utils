import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:yc_app_utils/models/card_background/card_background.model.dart';
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

  static BoxDecoration getBoxDecorationWithCardBackground({
    required CardBackground? cardBackground,
    double borderRadius = AppSpacing.s,
  }) {
    if (cardBackground == null) {
      return const BoxDecoration();
    }
    switch (cardBackground.backgroundType) {
      case SectionBgType.TRANSPARENT:
        return const BoxDecoration();
      case SectionBgType.FLAT_COLOR:
        return BoxDecoration(
          borderRadius: showSectionBorder(
              shouldLeaveBorder: cardBackground.shouldLeaveBorder,
              borderRadius: borderRadius),
          color: CommonHelpers.v2ColorFromHex(
            cardBackground.backgroundColor,
          ),
        );
      case SectionBgType.GRADIENT:
        return BoxDecoration(
          borderRadius: showSectionBorder(),
          gradient: LinearGradient(
            begin: getBeginDirection(cardBackground.gradientDirection),
            end: getBottomDirection(cardBackground.gradientDirection),
            colors: <Color>[
              CommonHelpers.v2ColorFromHex(
                cardBackground.gradientColor1,
              ),
              CommonHelpers.v2ColorFromHex(
                cardBackground.gradientColor2,
              )
            ],
          ),
        );
      case SectionBgType.IMAGE:
        return BoxDecoration(
          image: cardBackground.backgroundImageUrl != null
              ? DecorationImage(
                  // Only supports Non-vector image formats
                  image: CachedNetworkImageProvider(
                    cardBackground.backgroundImageUrl!,
                  ),
                  fit: BoxFit.cover,
                )
              : null,
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
