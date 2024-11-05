import 'package:yc_app_utils/yc_app_utils.dart';

class RichTextModel extends StyledComponentUnion {
  final List<RichTextChildModel>? texts;
  final V2TextStyle? primaryTextStyle;

  RichTextModel({
    this.texts,
    this.primaryTextStyle,
  });

  factory RichTextModel.fromMap(Map<String, dynamic> map) {
    return RichTextModel(
      texts: map["texts"] != null
          ? List.from(
              map["texts"].map(
                (e) => RichTextChildModel.fromMap(e),
              ),
            )
          : null,
      primaryTextStyle: map['primaryTextStyle'] != null
          ? V2TextStyle.fromMap(map['primaryTextStyle'])
          : null,
    );
  }

  RichTextModel copyWith({
    List<RichTextChildModel>? texts,
    V2TextStyle? primaryTextStyle,
  }) {
    return RichTextModel(
      texts: texts ?? this.texts,
      primaryTextStyle: primaryTextStyle ?? this.primaryTextStyle,
    );
  }
}

class RichTextChildModel {
  String? text;
  V2TextStyle? textStyle;

  RichTextChildModel({
    this.text,
    this.textStyle,
  });

  factory RichTextChildModel.fromMap(Map<String, dynamic> map) {
    return RichTextChildModel(
      text: map["text"],
      textStyle: map['textStyle'] != null
          ? V2TextStyle.fromMap(map['textStyle'])
          : null,
    );
  }

  RichTextChildModel copyWith({
    String? text,
    V2TextStyle? textStyle,
  }) {
    return RichTextChildModel(
      text: text ?? this.text,
      textStyle: textStyle ?? this.textStyle,
    );
  }
}
