import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:yc_app_utils/models/click_action/event_data.model.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

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

  static Map<String, dynamic> removeNullParams(
    Map<String, dynamic> data, {
    List<String>? excludeParams,
  }) {
    if (excludeParams != null) {
      data.removeWhere(
          (String k, dynamic v) => v == null && !excludeParams.contains(k));
    } else {
      data.removeWhere((String k, dynamic v) => v == null);
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
      return values.firstWhere((T type) {
        final elements = type.toString().split(".");
        return elements.last.toUpperCase() == value?.toUpperCase();
      });
    } catch (e) {
      return null;
    }
  }

  static String cleanEventString(String str) {
    String res = str;
    // Remove all except A-Z, a-z, 0-9, underscores, hyphens and white spaces.
    res = res.replaceAll(RegExp('[^A-Za-z0-9-_ ]'), '');
    // Replace all white spaces with underscores.
    res = res.replaceAll(' ', '_');
    // Replace all hyphens with underscores.
    res = res.replaceAll('-', '_');
    return convertCamelToSnake(res);
  }

  static String convertCamelToSnake(String text) {
    RegExp exp = RegExp(r'(?<=[a-z])[A-Z]');
    return text
        .replaceAllMapped(exp, (Match m) => ('_' + (m.group(0) ?? '')))
        .toLowerCase();
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

  static MainAxisAlignment getMainAxisAlignmentFromString(String? alignment) {
    switch (alignment) {
      case 'START':
        return MainAxisAlignment.start;
      case 'CENTER':
        return MainAxisAlignment.center;
      case 'END':
        return MainAxisAlignment.end;
      case 'SPACE_BETWEEN':
        return MainAxisAlignment.spaceBetween;
      case 'SPACE_AROUND':
        return MainAxisAlignment.spaceAround;
      case 'SPACE_EVENLY':
        return MainAxisAlignment.spaceEvenly;
      default:
        return MainAxisAlignment.center;
    }
  }

  static CrossAxisAlignment getCrossAxisAlignmentFromString(String? alignment) {
    switch (alignment) {
      case 'START':
        return CrossAxisAlignment.start;
      case 'CENTER':
        return CrossAxisAlignment.center;
      case 'END':
        return CrossAxisAlignment.end;
      case 'STRETCH':
        return CrossAxisAlignment.stretch;
      case 'BASELINE':
        return CrossAxisAlignment.baseline;
      default:
        return CrossAxisAlignment.center;
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

  static TextOverflow getTextOverflowFromString(String? alignment) {
    switch (alignment) {
      case 'CLIP':
        return TextOverflow.clip;
      case 'FADE':
        return TextOverflow.fade;
      case 'ELLIPSIS':
        return TextOverflow.ellipsis;
      case 'VISIBLE':
        return TextOverflow.visible;
      default:
        return TextOverflow.ellipsis;
    }
  }

  static BoxFit getBoxFitFromString(String boxFit) {
    switch (boxFit) {
      case "FILL":
        return BoxFit.fill;
      case "CONTAIN":
        return BoxFit.contain;
      case "COVER":
        return BoxFit.cover;
      case "FITWIDTH":
        return BoxFit.fitWidth;
      case "FITHEIGHT":
        return BoxFit.fitHeight;
      case "NONE":
        return BoxFit.none;
      case "SCALEDOWN":
        return BoxFit.scaleDown;
      default:
        return BoxFit.none;
    }
  }

  static OptionsOrientation getOptionsOrientationFromString(
      String? optionsOrientation) {
    switch (optionsOrientation) {
      case "VERTICAL":
        return OptionsOrientation.vertical;
      case "HORIZONTAL":
        return OptionsOrientation.horizontal;
      default:
        return OptionsOrientation.wrap;
    }
  }

  static String getBootstrapSizesFromClasses(String classes) {
    List<String> sizes = [];
    List<String> separatedClasses = classes.split(' ');
    for (var separatedClass in separatedClasses) {
      if (separatedClass.contains('col')) {
        sizes.add(separatedClass);
      }
    }
    return sizes.join(' ');
  }

  static String getBootstrapOffsetsFromClasses(String classes) {
    List<String> sizes = [];
    List<String> separatedClasses = classes.split(' ');
    for (var separatedClass in separatedClasses) {
      if (separatedClass.contains('offset')) {
        sizes.add(separatedClass);
      }
    }
    return sizes.join(' ');
  }

  static EdgeInsetsGeometry getPaddingFromList(List<int>? paddingItems) {
    if (paddingItems == null) {
      return EdgeInsets.zero;
    }
    switch (paddingItems.length) {
      case 0:
        return EdgeInsets.zero;
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

  static BorderRadius getBorderRadiusFromList(List<int>? borderRadiusItems) {
    if (borderRadiusItems == null) {
      return const BorderRadius.all(
        Radius.zero,
      );
    }
    switch (borderRadiusItems.length) {
      case 0:
        return const BorderRadius.all(
          Radius.zero,
        );
      case 1:
        return BorderRadius.all(
          Radius.circular(
            borderRadiusItems.first.toDouble(),
          ),
        );
      case 2:
        return BorderRadius.vertical(
          top: Radius.circular(
            borderRadiusItems.first.toDouble(),
          ),
          bottom: Radius.circular(
            borderRadiusItems.last.toDouble(),
          ),
        );
      default:
        return BorderRadius.only(
          topLeft: Radius.circular(
            borderRadiusItems[0].toDouble(),
          ),
          topRight: Radius.circular(
            borderRadiusItems[1].toDouble(),
          ),
          bottomRight: Radius.circular(
            borderRadiusItems[2].toDouble(),
          ),
          bottomLeft: Radius.circular(
            borderRadiusItems[3].toDouble(),
          ),
        );
    }
  }

  static List<BoxShadow>? getBoxShadowFromList(List<dynamic> shadow) {
    if (shadow.isEmpty) {
      return null;
    }
    return shadow
        .map(
          (s) => BoxShadow(
            color: CommonHelpers.v2ColorFromHex(s['color']),
            offset: Offset(
              s['offset']['dx'].toDouble(),
              s['offset']['dy'].toDouble(),
            ),
            blurRadius: s['blurRadius'].toDouble(),
            spreadRadius: s['spreadRadius'].toDouble(),
          ),
        )
        .toList();
  }

  /// This functions gets absolute height if the height provided is positive, else provides relative height in percentage.
  static double? getHeightFromDouble(double? height) {
    if (height == null) {
      return null;
    }
    if (height >= 0) {
      return height;
    } else {
      return YCMediaQuery.screenHeight * height.abs() / 100;
    }
  }

  static double? getWidthFromDouble(double? width) {
    if (width == null) {
      return null;
    }
    if (width >= 0) {
      return width;
    } else {
      return YCMediaQuery.screenWidth! * width.abs() / 100;
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
    TStyle? style, {
    TextStyle? customStyle,
  }) {
    Map<TStyle, TextStyle> textStyleMap = YCMediaQuery.getIsTablet()
        ? TextStyles.tabTextStyle
        : TextStyles.mobTextStyle;
    TextStyle tStyle = textStyleMap[style] ?? const TextStyle();
    return customStyle != null ? tStyle.merge(customStyle) : tStyle;
  }

  static BoxDecoration getBoxDecorationWithSectionBackground({
    required SectionBackground? sectionBackground,
    double borderRadius = AppSpacing.s,
  }) {
    if (sectionBackground == null) {
      return const BoxDecoration();
    }

    final Border? _border = sectionBackground.borderColor != null
        ? Border.all(
            width: sectionBackground.borderWidth,
            color: CommonHelpers.v2ColorFromHex(
              sectionBackground.borderColor,
            ),
          )
        : null;

    BorderRadius borderRadiusGeometry =
        getBorderRadiusFromList(sectionBackground.borderRadius);

    switch (sectionBackground.backgroundType) {
      case SectionBgType.TRANSPARENT:
        return const BoxDecoration();
      case SectionBgType.FLAT_COLOR:
        return BoxDecoration(
          border: _border,
          borderRadius: (sectionBackground.borderRadius?.isEmpty ?? true)
              ? showSectionBorder()
              : borderRadiusGeometry,
          color: CommonHelpers.v2ColorFromHex(
            "#" +
                ((sectionBackground.opacity * 256).toInt().toRadixString(16))
                    .toString() +
                sectionBackground.backgroundColor!.split('#').last,
          ),
        );
      case SectionBgType.GRADIENT:
        return BoxDecoration(
          border: _border,
          borderRadius: (sectionBackground.borderRadius?.isEmpty ?? true)
              ? showSectionBorder(
                  shouldLeaveBorder: sectionBackground.shouldLeaveBorder,
                  borderRadius: borderRadius,
                )
              : borderRadiusGeometry,
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
          border: _border,
          borderRadius: borderRadiusGeometry,
          image: sectionBackground.backgroundImgUrl != null
              ? DecorationImage(
                  // Only supports Non-vector image formats
                  image: CachedNetworkImageProvider(
                    sectionBackground.backgroundImgUrl!,
                  ),
                  fit: sectionBackground.backgroundImgBoxFit ?? BoxFit.cover,
                )
              : null,
        );

      case SectionBgType.RADIAL_GRADIENT:
        return BoxDecoration(
          border: _border,
          borderRadius: (sectionBackground.borderRadius?.isEmpty ?? true)
              ? showSectionBorder(
                  shouldLeaveBorder: sectionBackground.shouldLeaveBorder,
                  borderRadius: borderRadius,
                )
              : borderRadiusGeometry,
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

  static String? validateTextField({
    required String value,
    required Validation? validations,
  }) {
    if (validations == null) {
      return null;
    }
    // check for required
    if (validations.isRequired != null) {
      if (validations.isRequired!.value && value.isEmpty) {
        return validations.isRequired!.msg;
      }
    }

    // check for minLength
    if (validations.minLength != null) {
      if (value.length < validations.minLength!.value) {
        return validations.minLength!.msg;
      }
    }

    // check for maxLength
    if (validations.maxLength != null) {
      if (value.length > validations.maxLength!.value) {
        return validations.maxLength!.msg;
      }
    }

    // check for min (for number field)
    if (validations.min != null) {
      double? numericValue = double.tryParse(value);
      if (numericValue != null && numericValue < validations.min!.value) {
        return validations.min!.msg;
      }
    }

    // check for max (for number field)
    if (validations.max != null) {
      double? numericValue = double.tryParse(value);
      if (numericValue != null && numericValue > validations.max!.value) {
        return validations.max!.msg;
      }
    }

    // check for regex match
    if (validations.pattern != null) {
      if (!RegExp(validations.pattern!.value).hasMatch(value)) {
        return validations.pattern!.msg;
      }
    }
    return null;
  }

  static String? validateDateTimeField({
    required DateTime? value,
    required Validation? validations,
  }) {
    if (validations == null) {
      return null;
    }
    // check for required
    if (validations.isRequired != null) {
      if (validations.isRequired!.value && value == null) {
        return validations.isRequired!.msg;
      }
    }

    return null;
  }

  static String? validateRadioField({
    required OptionModel? value,
    required Validation? validations,
  }) {
    if (validations == null) {
      return null;
    }
    // check for required
    if (validations.isRequired != null) {
      if (validations.isRequired!.value && value == null) {
        return validations.isRequired!.msg;
      }
    }
    return null;
  }

  static String? validateSelectCheckField({
    required List<OptionModel> values,
    required Validation? validations,
  }) {
    if (validations == null) {
      return null;
    }

    // check for required
    if (validations.isRequired != null) {
      if (validations.isRequired!.value && values.isEmpty) {
        return validations.isRequired!.msg;
      }
    }

    // check for min
    if (validations.min != null) {
      if (values.length < validations.min!.value) {
        return validations.min!.msg;
      }
    }

    // check for max
    if (validations.max != null) {
      if (values.length > validations.max!.value) {
        return validations.max!.msg;
      }
    }

    return null;
  }

  static Future<T?> showYcDialog<T>({
    required BuildContext context,
    required Widget Function(BuildContext) builder,
    required String dialogName,
    bool barrierDismissible = true,
    bool useRootNavigator = true,
    bool useSafeArea = true,
    Color barrierColor = Colors.black54,
    Map<String, dynamic>? args,
    String? barrierLabel,
  }) {
    return showDialog<T>(
      context: context,
      builder: builder,
      routeSettings: RouteSettings(name: dialogName, arguments: args),
      barrierColor: barrierColor,
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel,
      useRootNavigator: useRootNavigator,
      useSafeArea: useSafeArea,
    );
  }

  static T? getValueFromEventData<T>(
    EventData? data, {
    required String key,
  }) {
    if ((data?.others ?? "").isEmpty) {
      return null;
    }
    try {
      final _dataMap = Map<String, dynamic>.from(
        jsonDecode(data!.others!),
      );
      return _dataMap[key];
    } catch (e) {
      return null;
    }
  }

  static V2StyledTextWidget getV2StyledTextWidgetFromTextStyle({
    required String text,
    required V2TextStyle? textStyle,
  }) {
    return V2StyledTextWidget(
      styledText: V2StyledTextModel.fromTextStyle(
        text: text,
        textStyle: textStyle ?? V2TextStyle(),
      ),
    );
  }

  static Alignment getAlignmentFromList(List<String>? alignmentValues) {
    if (alignmentValues == null) {
      return Alignment.centerLeft;
    }
    switch (alignmentValues.length) {
      case 0:
        return Alignment.centerLeft;
      case 1:
        return Alignment(
          double.tryParse(alignmentValues.first) ?? 0,
          double.tryParse(alignmentValues.first) ?? 0,
        );
      default:
        return Alignment(
          double.tryParse(alignmentValues[0]) ?? 0,
          double.tryParse(alignmentValues[1]) ?? 0,
        );
    }
  }
}
