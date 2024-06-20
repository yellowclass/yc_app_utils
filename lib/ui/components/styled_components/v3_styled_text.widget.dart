import 'package:flutter/material.dart';
import 'package:yc_app_utils/helpers/helpers.dart';
import 'package:yc_app_utils/models/styled_component/v3_styled_text.model.dart';

class V3StyledText extends StatefulWidget {
  final V3StyledTextModel v3StyledText;
  const V3StyledText({
    required this.v3StyledText,
    super.key,
  });

  @override
  State<V3StyledText> createState() => _V3StyledTextState();
}

class _V3StyledTextState extends State<V3StyledText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.v3StyledText.padding,
      decoration: CommonHelpers.getBoxDecorationWithSectionBackground(
          sectionBackground: widget.v3StyledText.background),
      child: RichText(
        textAlign: widget.v3StyledText.textAlign ?? TextAlign.start,
        maxLines: widget.v3StyledText.maxLines,
        overflow: widget.v3StyledText.textOverflow ?? TextOverflow.clip,
        text: TextSpan(
          children: List.generate(
            widget.v3StyledText.texts.length,
            (index) {
              final currentText = widget.v3StyledText.texts[index];
              return TextSpan(
                  text: currentText.text,
                  style:
                      CommonHelpers.getTextStyleFromV2TextStyle(currentText));
            },
          ),
        ),
      ),
    );
  }
}
