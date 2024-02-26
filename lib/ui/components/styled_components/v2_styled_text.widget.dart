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
      child: prefix == null ? _getPlainText() : _getRichText(),
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
    return CommonHelpers.getTextStyleFromV2TextStyle(styledText);
  }
}
