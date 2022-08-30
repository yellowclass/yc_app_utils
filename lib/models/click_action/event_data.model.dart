import 'dart:convert';

class EventData {
  String action;
  String? category;
  String? label;
  double? value;
  String? others;
  Map<String, dynamic>? additionalData;

  EventData({
    required this.action,
    this.category,
    this.label,
    this.value,
    this.others,
    this.additionalData,
  });

  EventData copyWith({
    String? action,
    String? category,
    String? label,
    double? value,
    String? others,
  }) {
    return EventData(
      action: action ?? this.action,
      category: category ?? this.category,
      label: label ?? this.label,
      value: value ?? this.value,
      others: others ?? this.others,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'action': action,
      'category': category,
      'label': label,
      'value': value,
      'others': others,
      'additionalData':
          additionalData == null ? null : jsonEncode(additionalData),
    };
  }

  factory EventData.fromMap(Map<String, dynamic> map) {
    return EventData(
      action: map['action'] ?? '',
      category: map['category'],
      label: map['label'],
      value: map['value']?.toDouble(),
      others: map['others'],
      additionalData: jsonDecode(map['additionalData']),
    );
  }
}
