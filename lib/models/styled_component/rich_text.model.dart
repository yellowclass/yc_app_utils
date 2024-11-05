import 'package:flutter/foundation.dart';
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
      texts: map['texts'] != null
          ? List<RichTextChildModel>.from(
              (map['texts']).map<RichTextChildModel?>(
                (x) => RichTextChildModel.fromMap(x),
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

  @override
  String toString() =>
      'RichTextModel(texts: $texts, primaryTextStyle: $primaryTextStyle)';

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'texts': texts?.map((x) => x?.toMap()).toList(),
      'primaryTextStyle': primaryTextStyle?.toMap(),
    };
  }

  @override
  bool operator ==(covariant RichTextModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.texts, texts) &&
        other.primaryTextStyle == primaryTextStyle;
  }

  @override
  int get hashCode => texts.hashCode ^ primaryTextStyle.hashCode;
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
      text: map['text'] != null ? map['text'] as String : null,
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'textStyle': textStyle?.toMap(),
    };
  }

  @override
  String toString() => 'RichTextChildModel(text: $text, textStyle: $textStyle)';

  @override
  bool operator ==(covariant RichTextChildModel other) {
    if (identical(this, other)) return true;

    return other.text == text && other.textStyle == textStyle;
  }

  @override
  int get hashCode => text.hashCode ^ textStyle.hashCode;
}
