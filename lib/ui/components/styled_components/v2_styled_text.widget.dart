import 'package:flutter/material.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class V2StyledTextWidget extends StatelessWidget {
  const V2StyledTextWidget({
    required this.styledText,
    Key? key,
  }) : super(key: key);

  final V2StyledTextModel styledText;

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
      child: Text(
        styledText.text,
        textAlign: styledText.textAlign,
        overflow: styledText.textOverflow,
        maxLines: styledText.maxLines,
        style: CommonHelpers.getTextStyle(
          styledText.tStyle,
          customStyle: TextStyle(
            letterSpacing: styledText.letterSpacing,
            fontStyle:
                styledText.italic == true ? FontStyle.italic : FontStyle.normal,
            color: CommonHelpers.v2ColorFromHex(
              styledText.textColor,
            ),
            decoration: styledText.strikeThrough == true
                ? TextDecoration.lineThrough
                : null,
          ),
        ),
      ),
    );
  }
}
