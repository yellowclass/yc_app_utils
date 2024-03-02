import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:yc_app_utils/yc_app_utils.dart';

class AutocompleteFieldData {
  final String value;
  final String inputText;
  final List<V2StyledTextModel>? texts;

  AutocompleteFieldData({
    required this.value,
    required this.inputText,
    required this.texts,
  });

  AutocompleteFieldData copyWith({
    String? value,
    String? inputText,
    List<V2StyledTextModel>? texts,
  }) {
    return AutocompleteFieldData(
      value: value ?? this.value,
      inputText: inputText ?? this.inputText,
      texts: texts ?? this.texts,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'inputText': inputText,
    };
  }

  factory AutocompleteFieldData.fromMap(Map<String, dynamic> map) {
    return AutocompleteFieldData(
      value: map['value'] as String,
      inputText: map['inputText'] as String,
      texts: map['texts'] != null
          ? List<V2StyledTextModel>.from(
              (map['texts'] as List<dynamic>).map<V2StyledTextModel>(
                (x) => V2StyledTextModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AutocompleteFieldData.fromJson(String source) =>
      AutocompleteFieldData.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AutocompleteFieldData(value: $value, inputText: $inputText, texts: $texts)';

  @override
  bool operator ==(covariant AutocompleteFieldData other) {
    if (identical(this, other)) {
      return true;
    }

    return other.value == value &&
        other.inputText == inputText &&
        listEquals(other.texts, texts);
  }

  @override
  int get hashCode => value.hashCode ^ inputText.hashCode ^ texts.hashCode;
}
