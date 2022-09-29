import 'package:flutter/material.dart';

import 'package:yc_app_utils/helpers/common_helpers.dart';
import 'package:yc_app_utils/models/styled_component/styled_text.model.dart';
import 'package:yc_app_utils/ui/components/generic_network_image.dart';
import 'package:yc_app_utils/ui/styleguide/spacing.dart';
import 'package:yc_app_utils/ui/text_styles/tstyle.enum.dart';

class StyledTextWidget extends StatelessWidget {
  const StyledTextWidget({
    this.styledText,
    this.repText = "",
    this.repTextColor = "#000000",
    this.repTStyle = TStyle.B2_400,
    this.maxLines,
    this.overflow,
    this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.lineHeight,
    Key? key,
  }) : super(key: key);

  final StyledText? styledText;
  final String repText;
  final String repTextColor;
  final TStyle repTStyle;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final CrossAxisAlignment crossAxisAlignment;
  final double? lineHeight;

  @override
  Widget build(BuildContext context) {
    int iconFlex = 3;
    int textFlex = 12 -
        (styledText?.prefixIcon?.url == null ? 0 : iconFlex) -
        (styledText?.suffixIcon?.url == null ? 0 : iconFlex);

    return Container(
      padding: styledText?.padding != null
          ? CommonHelpers.getPaddingFromList(styledText!.padding!)
          : null,
      decoration: styledText?.background != null
          ? CommonHelpers.getBoxDecorationWithSectionBackground(
              sectionBackground: styledText!.background!,
            ).copyWith(
              borderRadius: (styledText?.borderRadii?.isNotEmpty ?? false)
                  ? CommonHelpers.getBorderRadiusFromList(
                      styledText!.borderRadii,
                    )
                  : BorderRadius.circular(
                      styledText?.borderRadius?.toDouble() ?? 0,
                    ),
            )
          : BoxDecoration(
              color: CommonHelpers.v2ColorFromHex(
                styledText?.backgroundColor,
              ),
              borderRadius: BorderRadius.circular(
                styledText?.borderRadius?.toDouble() ?? 0,
              ),
            ),
      child: Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: styledText?.flexAlignment ?? MainAxisAlignment.start,
        children: [
          if (styledText?.prefixIcon?.url != null) ...[
            Flexible(
              flex: iconFlex,
              child: GenericNetworkImage(
                styledText!.prefixIcon!.url!,
              ),
            ),
            AppSpacing.xxsWidth,
          ],
          Flexible(
            flex: textFlex,
            child: Text(
              styledText?.text ?? repText,
              overflow: overflow ?? TextOverflow.ellipsis,
              maxLines: maxLines,
              textAlign: textAlign,
              style: CommonHelpers.getTextStyle(
                styledText?.tStyle ?? repTStyle,
                customStyle: TextStyle(
                  color: CommonHelpers.v2ColorFromHex(
                    styledText?.textColor ?? repTextColor,
                  ),
                  height: lineHeight,
                ),
              ),
            ),
          ),
          if (styledText?.suffixIcon?.url != null) ...[
            AppSpacing.xxsWidth,
            Flexible(
              flex: iconFlex,
              child: GenericNetworkImage(
                styledText!.suffixIcon!.url!,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
