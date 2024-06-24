import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/helpers.dart';
import 'package:yc_app_utils/models/styled_component/rich_text.model.dart';

class RichTextWidget extends StatefulWidget {
  final RichTextModel richText;
  const RichTextWidget({
    required this.richText,
    super.key,
  });

  @override
  State<RichTextWidget> createState() => _RichTextWidgetState();
}

class _RichTextWidgetState extends State<RichTextWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.richText.texts?.isEmpty ?? true
        ? const SizedBox.shrink()
        : Container(
            padding: CommonHelpers.getPaddingFromList(
              widget.richText.primaryTextStyle?.padding,
            ),
            decoration: CommonHelpers.getBoxDecorationWithSectionBackground(
                sectionBackground:
                    widget.richText.primaryTextStyle?.background),
            child: RichText(
              textAlign: widget.richText.primaryTextStyle?.textAlign ??
                  TextAlign.start,
              maxLines: widget.richText.primaryTextStyle?.maxLines,
              overflow: widget.richText.primaryTextStyle?.textOverflow ??
                  TextOverflow.clip,
              text: TextSpan(
                style: CommonHelpers.getTextStyleFromV2TextStyle(
                  widget.richText.primaryTextStyle,
                ),
                children: List.generate(
                  widget.richText.texts?.length ?? 0,
                  (index) {
                    final currentText = widget.richText.texts![index];
                    return TextSpan(
                      text: currentText.text,
                      style: CommonHelpers.getTextStyleFromV2TextStyle(
                        currentText.textStyle,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
  }
}
