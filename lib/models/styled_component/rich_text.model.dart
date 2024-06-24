import 'package:yc_app_utils/yc_app_utils.dart';

class RichTextModel extends StyledComponentUnion {
  final List<RichTextChildModel>? texts;
  final V2TextStyle? primaryTextStyle;

  RichTextModel({this.texts, this.primaryTextStyle});

  factory RichTextModel.fromMap(Map<String, dynamic> map) {
    return RichTextModel(
      texts: List.from(map["texts"].map((e) => RichTextChildModel.fromMap(e))),
      primaryTextStyle: map['primaryTextStyle'] != null
          ? V2TextStyle.fromMap(map['primaryTextStyle'])
          : null,
    );
  }
}

class RichTextChildModel {
  String? text;
  V2TextStyle? textStyle;

  RichTextChildModel({this.text, this.textStyle});

  factory RichTextChildModel.fromMap(Map<String, dynamic> map) {
    return RichTextChildModel(
      text: map["text"],
      textStyle: map['textStyle'] != null
          ? V2TextStyle.fromMap(map['textStyle'])
          : null,
    );
  }
}
