import 'package:flutter/material.dart';
import 'package:yc_app_utils/yc_app_utils.dart';

class V2StyledTextWidget extends StatelessWidget {
  V2StyledTextWidget({
    required this.styledText,
    Key? key,
  }) : super(key: key);

  V2StyledTextWidget.withPrefix({
    required this.styledText,
    required this.prefix,
    required this.prefixAlignment,
    Key? key,
  }) : super(key: key);

  final V2StyledTextModel styledText;
  Widget? prefix;
  PlaceholderAlignment? prefixAlignment;

  Widget _getTextWidget() {
    return prefix == null ? _getPlainText() : _getRichText();
  }

  Alignment _iconAlignment(TextIconAlignmentEnum? iconAlignment) {
    if (iconAlignment == null) {
      return Alignment.center;
    }
    if (iconAlignment == TextIconAlignmentEnum.TOP) {
      return Alignment.topCenter;
    }
    if (iconAlignment == TextIconAlignmentEnum.BOTTOM) {
      return Alignment.bottomCenter;
    }
    return Alignment.center;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: CommonHelpers.getPaddingFromList(
        styledText.padding,
      ),
      decoration: CommonHelpers.getBoxDecorationWithSectionBackground(
        sectionBackground: styledText.background,
      ).copyWith(
        borderRadius: CommonHelpers.getBorderRadiusFromList(
          styledText.borderRadius,
        ),
        border: styledText.borderColor != null
            ? Border.all(
                color: CommonHelpers.v2ColorFromHex(
                  styledText.borderColor,
                ),
              )
            : null,
      ),
      child: styledText.prefixIcon?.url == null &&
              styledText.suffixIcon?.url == null
          ? _getTextWidget()
          : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment:
                  styledText.flexAlignment ?? MainAxisAlignment.start,
              children: [
                if (styledText.prefixIcon?.url != null)
                  Align(
                    alignment: _iconAlignment(styledText.prefixIconAlignment),
                    child: SizedBox(
                      width: styledText.prefixIcon?.width,
                      height: styledText.prefixIcon?.height,
                      child: GenericNetworkImage(
                        styledText.prefixIcon!.url!,
                        width: styledText.prefixIcon?.width,
                        height: styledText.prefixIcon?.height,
                      ),
                    ),
                  ),
                Flexible(child: _getTextWidget()),
                if (styledText.suffixIcon?.url != null)
                  Align(
                    alignment: _iconAlignment(styledText.suffixIconAlignment),
                    child: SizedBox(
                      width: styledText.suffixIcon?.width,
                      height: styledText.suffixIcon?.height,
                      child: GenericNetworkImage(
                        styledText.suffixIcon!.url!,
                        width: styledText.suffixIcon?.width,
                        height: styledText.suffixIcon?.height,
                      ),
                    ),
                  )
              ],
            ),
    );
  }

  Text _getPlainText() {
    return Text(
      styledText.text,
      textAlign: styledText.textAlign,
      overflow: styledText.textOverflow,
      maxLines: styledText.maxLines,
      style: _getStyle(),
    );
  }

  RichText _getRichText() {
    return RichText(
      textAlign: styledText.textAlign ?? TextAlign.start,
      overflow: styledText.textOverflow ?? TextOverflow.clip,
      maxLines: styledText.maxLines,
      text: TextSpan(
        children: [
          WidgetSpan(
            child: prefix!,
            alignment: prefixAlignment ?? PlaceholderAlignment.bottom,
          ),
          TextSpan(
            text: styledText.text,
            style: _getStyle(),
          )
        ],
      ),
    );
  }

  TextStyle? _getStyle() {
    return CommonHelpers.getTextStyleFromV2StyledText(styledText);
  }
}
