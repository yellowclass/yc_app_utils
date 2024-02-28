// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:yc_app_utils/models/autocomplete_suggestion/autocomplete_field_data.model.dart';

class AutocompleteSuggestions {
  final List<AutocompleteFieldData>? suggestions;

  AutocompleteSuggestions({
    required this.suggestions,
  });

  AutocompleteSuggestions copyWith({
    List<AutocompleteFieldData>? suggestions,
  }) {
    return AutocompleteSuggestions(
      suggestions: suggestions ?? this.suggestions,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'suggestions': suggestions?.map((x) => x.toMap()).toList(),
    };
  }

  factory AutocompleteSuggestions.fromMap(Map<String, dynamic>? map) {
    if (map == null) {
      return AutocompleteSuggestions(suggestions: <AutocompleteFieldData>[]);
    }
    return AutocompleteSuggestions(
      suggestions: map['suggestions'] != null
          ? List<AutocompleteFieldData>.from(
              (map['suggestions'] as List<dynamic>).map<AutocompleteFieldData>(
                (x) => AutocompleteFieldData.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AutocompleteSuggestions.fromJson(String source) =>
      AutocompleteSuggestions.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AutocompleteSuggestions(suggestions: $suggestions)';

  @override
  bool operator ==(covariant AutocompleteSuggestions other) {
    if (identical(this, other)) {
      return true;
    }

    return listEquals(other.suggestions, suggestions);
  }

  @override
  int get hashCode => suggestions.hashCode;
}
