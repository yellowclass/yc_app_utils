import 'package:yc_app_utils/yc_app_utils.dart';

class AlertDialogModel {
  V2StyledTextModel? title;
  V2StyledTextModel? content;
  MultiButtonSchema? actions;

  AlertDialogModel({
    this.title,
    this.content,
    this.actions,
  });

  AlertDialogModel copyWith({
    V2StyledTextModel? title,
    V2StyledTextModel? content,
    MultiButtonSchema? actions,
  }) {
    return AlertDialogModel(
      title: title ?? this.title,
      content: content ?? this.content,
      actions: actions ?? this.actions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title?.toMap(),
      'content': content?.toMap(),
    };
  }

  factory AlertDialogModel.fromMap(Map<String, dynamic> map) {
    return AlertDialogModel(
      title:
          map['title'] != null ? V2StyledTextModel.fromMap(map['title']) : null,
      content: map['content'] != null
          ? V2StyledTextModel.fromMap(map['content'])
          : null,
      actions: map['actions'] != null
          ? MultiButtonSchema.fromMap(map['actions'])
          : null,
    );
  }
}
